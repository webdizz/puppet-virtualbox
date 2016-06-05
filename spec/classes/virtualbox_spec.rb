require 'spec_helper'

describe 'virtualbox' do
  let(:test_params) { {} }

  let(:params) { test_params }

  it do
    should contain_exec('Kill Virtual Box Processes').with({
      :command => 'pkill "VBoxXPCOMIPCD" || true && pkill "VBoxSVC" || true && pkill "VBoxHeadless" || true',
      :path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
      :refreshonly => true,
    })
  end

  context "by default" do
    it do
      should contain_package('VirtualBox-4.3.14-95030').with({
        :ensure   => 'installed',
        :source   => 'http://download.virtualbox.org/virtualbox/4.3.14/VirtualBox-4.3.14-95030-OSX.dmg',
        :provider => 'pkgdmg',
        :require  => 'Exec[Kill Virtual Box Processes]',
      })
    end
  end

  context "with overridden $version and $patchlevel" do
    let(:params) { test_params.merge(version: "5.0.20", patchlevel: "106931") }

    it do
      should contain_package('VirtualBox-5.0.20-106931').with({
        :ensure   => 'installed',
        :source   => 'http://download.virtualbox.org/virtualbox/5.0.20/VirtualBox-5.0.20-106931-OSX.dmg',
        :provider => 'pkgdmg',
        :require  => 'Exec[Kill Virtual Box Processes]',
      })
    end
  end
end
