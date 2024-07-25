<?php

$finder = PhpCsFixer\Finder::create()
    ->in(__DIR__)
    ->name('*.php')
    ->notName('*.blade.php')
    ->exclude('vendor')
    ->exclude('storage')
    ->exclude('bootstrap/cache')
    ->notPath('*/cache/*');

$config = new PhpCsFixer\Config();
return $config->setRules([
    '@PSR2' => true,
    'array_syntax' => ['syntax' => 'short'],
    'ordered_imports' => true,
    'no_unused_imports' => true,
    'no_extra_blank_lines' => true,
])
    ->setFinder($finder);
