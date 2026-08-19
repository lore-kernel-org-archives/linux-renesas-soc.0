Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770551F942
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 23:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787180905; cv=none; b=kIRPvgf4EmK3UfruJ/UGSeKAQOiYS10vwRco8TSh/GjIsM4VACP9hcBEuK574/IkkytnKylQ7piYmqSUePncBJf2FUAkyhPb8jQqj1W65/9JEVpGVmnbzaA9ZMUJgCzRIrBFf0LAR5Vfa4k8Ed9zlq2XnEMXSCaJm4vkQWG5beQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787180905; c=relaxed/simple;
	bh=dGwsFaCzHxvEmwi2AoLGVwQWfgYGHY4mP65plRTWh5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nGn7szAkGR4x8+KxXhzB6vDF5dFOdFnnd9iYGH6UhxIOdQs4V4onkrTK9Jer0jqmIQBr/TG3iZiRRz0GICZzMQA+DwVk1pCVA3Y0gS4BRM+A1/cDreSH77Nhv4ISbwoapebHC2XEWNJwO/mArmJ8t/vWZgTqpDXNvk3ka5xtxJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wuj6krd2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wuj6krd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787180903; x=1818716903;
  h=date:from:to:cc:subject:message-id;
  bh=dGwsFaCzHxvEmwi2AoLGVwQWfgYGHY4mP65plRTWh5k=;
  b=Wuj6krd2WZDZpENYZWHt8gtoN2/odkSdZdXd4ZSCmbqKsDJDLQMSvrS6
   au/n1Ak8Da8/2n7DtVi3hahvcFtOoLvvMgCgUyI21N5s0s0job1gGaRES
   hOM3bQ09xIBnq2/bNIkaz62Lr2U+ie7GPjHHZltnjRVMT5JfU+e1oHahe
   MgPSNMrhBGDCRUGZUrMTmYAfEXSUWbKJEBMZw8qlTMkXeoLW7l+YgHexg
   kVFBA7IncuhlkSpk4fsLeMcm1O2jbfficlmEe/IkyEVlnW3xTyP5wZchG
   nCiEf2l+wcegw13CRNTD5YzomLNmlNtfORRrifJFL53Ep61WeFZljxa4D
   A==;
X-CSE-ConnectionGUID: HEYGZOmaRIq52iyw8LgKuw==
X-CSE-MsgGUID: uoYLiHr4SiC2B8fTx667aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="75240971"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="75240971"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 16:08:22 -0700
X-CSE-ConnectionGUID: xjkXyB3GQBqZDVUD0v4efg==
X-CSE-MsgGUID: GECICbewQNmjOSDu2nWZCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="269987787"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Aug 2026 16:08:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwpOM-00000000gr7-3NCV;
	Wed, 19 Aug 2026 23:08:18 +0000
Date: Thu, 20 Aug 2026 07:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 03fb6a6169e563cfc4ad01bac2578fa412a343d3
Message-ID: <202608200732.FF0G0YsJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 03fb6a6169e563cfc4ad01bac2578fa412a343d3  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202608191120.4qS1lHiP-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202608192230.6MHdCZJS-lkp@intel.com

    drivers/gpu/drm/xe/xe_device.c:51:10: fatal error: 'xe_log.h' file not found
    drivers/gpu/drm/xe/xe_device.c:51:10: fatal error: xe_log.h: No such file or directory
    drivers/gpu/drm/xe/xe_guc_submit.c:844:10: error: 'struct xe_guc_exec_queue' has no member named 'multi_queue'
    drivers/gpu/drm/xe/xe_guc_submit.c:844:12: error: no member named 'multi_queue' in 'struct xe_guc_exec_queue'
    drivers/gpu/drm/xe/xe_guc_submit.c:844:31: error: 'struct xe_guc_exec_queue' has no member named 'multi_queue'
    drivers/gpu/drm/xe/xe_guc_submit.c:868:18: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
    drivers/gpu/drm/xe/xe_guc_submit.c:868:20: error: no member named 'cgp_update_q' in 'struct xe_exec_queue_group'
    drivers/gpu/drm/xe/xe_guc_submit.c:868:25: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
    drivers/gpu/drm/xe/xe_pci.c:28:10: fatal error: 'xe_log.h' file not found
    drivers/gpu/drm/xe/xe_pci.c:28:10: fatal error: xe_log.h: No such file or directory

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-randconfig-r053-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- csky-randconfig-002-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- i386-buildonly-randconfig-003-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- i386-randconfig-001-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- i386-randconfig-004-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- i386-randconfig-006-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- i386-randconfig-053-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- i386-randconfig-054-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- m68k-randconfig-r054-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- um-randconfig-002-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- um-randconfig-r051-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- x86_64-randconfig-003-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h-file-not-found
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:no-member-named-cgp_update_q-in-struct-xe_exec_queue_group
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:no-member-named-multi_queue-in-struct-xe_guc_exec_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h-file-not-found
|-- x86_64-randconfig-005-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- x86_64-randconfig-014-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- x86_64-randconfig-071
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- x86_64-randconfig-073-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
|-- x86_64-randconfig-102-20260819
|   |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
|   |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
|   `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory
`-- x86_64-randconfig-r052-20260819
    |-- drivers-gpu-drm-xe-xe_device.c:fatal-error:xe_log.h:No-such-file-or-directory
    |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_exec_queue_group-has-no-member-named-cgp_update_q
    |-- drivers-gpu-drm-xe-xe_guc_submit.c:error:struct-xe_guc_exec_queue-has-no-member-named-multi_queue
    `-- drivers-gpu-drm-xe-xe_pci.c:fatal-error:xe_log.h:No-such-file-or-directory

elapsed time: 1474m

configs tested: 100
configs skipped: 0

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260819    gcc-11.5.0
arc                  randconfig-002-20260819    gcc-13.4.0
arm                  randconfig-001-20260819    gcc-13.4.0
arm                  randconfig-002-20260819    gcc-15.2.0
arm                  randconfig-003-20260819    gcc-10.5.0
arm                  randconfig-004-20260819    gcc-15.2.0
arm                        vf610m4_defconfig    gcc-16.1.0
arm64                randconfig-001-20260819    gcc-11.5.0
arm64                randconfig-002-20260819    clang-17
arm64                randconfig-003-20260819    clang-17
arm64                randconfig-004-20260819    gcc-8.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260819    gcc-9.5.0
csky                 randconfig-002-20260819    gcc-11.5.0
hexagon              randconfig-001-20260819    clang-22
hexagon              randconfig-002-20260819    clang-24
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260819    clang-22
i386       buildonly-randconfig-002-20260819    gcc-14
i386       buildonly-randconfig-003-20260819    gcc-14
i386       buildonly-randconfig-004-20260819    gcc-14
i386       buildonly-randconfig-005-20260819    gcc-14
i386       buildonly-randconfig-006-20260819    gcc-12
i386                          randconfig-001    clang-22
i386                 randconfig-001-20260819    gcc-14
i386                 randconfig-002-20260819    gcc-14
i386                 randconfig-003-20260819    gcc-14
i386                 randconfig-004-20260819    gcc-14
i386                 randconfig-005-20260819    gcc-14
i386                 randconfig-006-20260819    gcc-12
i386                 randconfig-007-20260819    clang-22
i386                 randconfig-011-20260819    gcc-13
i386                 randconfig-012-20260819    gcc-14
i386                 randconfig-013-20260819    gcc-14
i386                 randconfig-014-20260819    clang-22
i386                 randconfig-015-20260819    clang-22
i386                 randconfig-016-20260819    clang-22
i386                 randconfig-017-20260819    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260819    clang-24
loongarch            randconfig-002-20260819    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260819    gcc-11.5.0
nios2                randconfig-002-20260819    gcc-8.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260819    gcc-8.5.0
parisc               randconfig-002-20260819    gcc-16.1.0
powerpc              randconfig-001-20260819    clang-24
powerpc              randconfig-002-20260819    gcc-8.5.0
powerpc64            randconfig-001-20260819    clang-24
powerpc64            randconfig-002-20260819    clang-21
riscv                randconfig-001-20260819    gcc-8.5.0
riscv                randconfig-002-20260819    gcc-9.5.0
s390                 randconfig-001-20260819    gcc-14.3.0
s390                 randconfig-002-20260819    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260819    gcc-16.1.0
sh                   randconfig-002-20260819    gcc-11.5.0
sparc                randconfig-001-20260819    gcc-12.5.0
sparc                randconfig-002-20260819    gcc-8.5.0
sparc64              randconfig-001-20260819    clang-20
sparc64              randconfig-002-20260819    gcc-10.5.0
um                   randconfig-001-20260819    gcc-14
um                   randconfig-002-20260819    gcc-12
x86_64     buildonly-randconfig-001-20260819    gcc-14
x86_64     buildonly-randconfig-002-20260819    gcc-14
x86_64     buildonly-randconfig-003-20260819    gcc-14
x86_64     buildonly-randconfig-004-20260819    gcc-14
x86_64     buildonly-randconfig-005-20260819    gcc-14
x86_64     buildonly-randconfig-006-20260819    gcc-14
x86_64               randconfig-001-20260819    clang-22
x86_64               randconfig-002-20260819    clang-22
x86_64               randconfig-003-20260819    clang-22
x86_64               randconfig-004-20260819    clang-22
x86_64               randconfig-005-20260819    gcc-14
x86_64               randconfig-006-20260819    gcc-14
x86_64                        randconfig-011    gcc-14
x86_64               randconfig-011-20260819    gcc-14
x86_64               randconfig-012-20260819    gcc-14
x86_64               randconfig-013-20260819    gcc-14
x86_64               randconfig-014-20260819    gcc-14
x86_64               randconfig-015-20260819    clang-22
x86_64               randconfig-016-20260819    gcc-12
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260819    gcc-14
x86_64               randconfig-072-20260819    gcc-14
x86_64               randconfig-073-20260819    gcc-12
x86_64               randconfig-074-20260819    clang-22
x86_64               randconfig-075-20260819    gcc-14
x86_64               randconfig-076-20260819    gcc-14
xtensa               randconfig-001-20260819    gcc-16.1.0
xtensa               randconfig-002-20260819    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
