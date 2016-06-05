# Installs VirtualBox
#
# Usage:
#
#   include virtualbox
class virtualbox (
  $version = $virtualbox::version,
  $patchlevel = $virtualbox::patchlevel,
) {

  exec { 'Kill Virtual Box Processes':
    command     => 'pkill "VBoxXPCOMIPCD" || true && pkill "VBoxSVC" || true && pkill "VBoxHeadless" || true',
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
  }

  package { "VirtualBox-${version}-${patchlevel}":
    ensure   => installed,
    provider => 'pkgdmg',
    source   => "http://download.virtualbox.org/virtualbox/${version}/VirtualBox-${version}-${patchlevel}-OSX.dmg",
    require  => Exec['Kill Virtual Box Processes'],
  }
}
