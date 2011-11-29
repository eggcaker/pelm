<?php
/**
 * Emacs lisp manager
 *
 * Features:
 * 1. generate init.el file based on config.php
 * 2. display the loading time
 * 3. can use the org-mode file,load automatictlly 
 */

require 'config.php';

if (count($argv) != 3)
    die("./package.sh <init|..> <mac|linux|win> [params]\n\n");

switch ($argv[1])
{
    case 'init':
        init($packages,$argv);
        break;

    default:
        echo "./package.sh <init|..> <mac|linux|win> [params]\n\n";
        break;
}

function init($packages, $argv)
{

    if (file_exists(EDD.'init.el'))
        rename(EDD.'init.el', EDD."init-".date("Y-m-d").'.el');

    $init_el_content =";; init.el of emacs\n;; Author: Caker\n\n";
    $init_el_content .= '(setq ROOT-PATH "'.EDD.'")'."\n\n";
    $init_el_content .= "(require 'org)\n\n"; //temp for emacs23 ,not load org-mode correctly

    foreach ($packages as $folder=>$config) {
        if (count($config) > 0) {
            $init_el_content .= ";; $folder\n";
            $init_el_content .= '(setq load-path (append (list "'.EDD.$folder.'") load-path))'."\n";

            foreach ($config as $key => $value) {
                if (isset($value['folder'])) {
                    if (!isset($value['disabled']) || !$value['disabled']) {
                        $init_el_content .= '(setq load-path (append (list "'.EDD.$folder.DS.$value['folder'].DS.'") load-path))'."\n";
                        $name_array = explode(".", $value['name']);
                        if ( strtolower($name_array[count($name_array)-1]) == 'el') {
                            $init_el_content .= '(load-file "'.EDD.$folder.DS.$value['folder'].DS.$value['name']."\")\n";
                        } else  if ( strtolower($name_array[count($name_array)-1]) == 'org') {
                            $init_el_content .= '(org-babel-load-file "'.EDD.$folder.DS.$value['folder'].DS.$value['name']."\")\n";
                        } 
                    }
                } else {
                    if (strtoupper($folder) == 'OS') {
                        if (file_exists(EDD.$folder.DS.$value['folder'].$argv[2].".el")) {
                            $init_el_content .= '(load-file "'.EDD.$folder.DS.$value['folder'].$argv[2].".el\")\n";
                        } else if (file_exists(EDD.$folder.DS.$value['folder'].$argv[2].".org")) {
                            $init_el_content .= '(org-babel-load-file "'.EDD.$folder.DS.$value['folder'].$argv[2].".org\")\n";
                        }
                        break;
                    } else {
                        $name_array = explode(".", $value['name']);
                        if ( strtolower($name_array[count($name_array)-1]) == 'el') {
                            $init_el_content .= '(load-file "'.EDD.$folder.DS.$value['name'].'")'."\n";
                        } else if ( strtolower($name_array[count($name_array)-1]) == 'org') {
                            $init_el_content .= '(org-babel-load-file "'.EDD.$folder.DS.$value['name'].'")'."\n";
                        }
                    }
                }
            }
            $init_el_content .= "\n";
        }
    }

    $init_el_content .= '(if (file-exists-p "~/.emacs.d/local.el")';
    $init_el_content .= "\n";
    $init_el_content .= '(load-file "~/.emacs.d/local.el"))';
    $init_el_content .= "\n\n";

    $init_el_content .= '(if (file-exists-p "~/.emacs.d/local.org")';
    $init_el_content .= "\n";
    $init_el_content .= '(org-babel-load-file "~/.emacs.d/local.org"))';
    $init_el_content .= "\n\n";
    
    $init_el_content .= "(package-manager-show-load-time)\n";
    $init_el_content .=";;; ends init.el here";
    file_put_contents(EDD.'init.el', $init_el_content);

    echo "generated the init.el.\n";
}

