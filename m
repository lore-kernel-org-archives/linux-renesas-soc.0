Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532090;
	b=zmZp60I3ITDg3upBppodPnHUAES72cEuQtFZtL0o6k4we1khdS4Wy9Xwdfd0MUK6s76d
	 dL6HaCja0J2VwM2D359zx8/qKbBf49Am0de0TLtBIDsF+zsN2ySo5Vp5r7frCYy8SzNCa
	 sOmVHV6MpqFNYOQCieEj4XTI7WORfc0QPOiGgEWNCRZceKAPa7CKVI/+7rztb5mO95dwh
	 MFoMH2LurCqlo52Sh2HAJvcp2wUBUQ/YsJC5DU2ICvcuSY92waZz72QPK9Nkj7DK3yYmZ
	 2O+RddiS4aiEC7CMbYi2S6qkJzAKs2mM7YqfPeSSKkHNbu5L8mvJuw++S/ZJHN5UaCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532090;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=N5KdReB9nOh0RRLoNJp6rBs7XuyQje9kyJ5TNIukeYU=;
	b=SbQBTXR3P3vqj4+UFsjUSrMk8GoSSo9DeC1K5F8P9Tu6hBvMntRLhnKX9r0aX0SKZT4T
	 mrmlUsq3Xs8BqdGARqhQc+o7RT3CRVVct+RJSFoog6fskXb5ZkBiw9UcRFG0QwgDTF44c
	 LswsAxNcXjuEPuhuBSG6u8Y6sf2q2EC4KyQs6PcD9aEQE9dIB/Um/uVizRnqMFhBYzYXJ
	 XcVGTpcPnDB8bnu7gB4F8XwtVFp3NrESNwaZo3m7qiNZ6BrIF/3lcWQ1HpD1KeViuB5qG
	 ezFLsWXcI6QiB1K1iVc+fvQMCnoZ/PFGpPLZcCNbIMyIo3r9IjoQueUPcrnzUYeineA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dwWB7eJA;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD38606A321
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 14:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD38606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dwWB7eJA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795532090; x=1827068090;
  h=date:from:to:cc:subject:message-id;
  bh=DdrE5Nt+1zlIOTqOKqLwCCz8MTdcTt7XMdpkQSqauRQ=;
  b=dwWB7eJABR8GWHkeZX0f40jtmpE7dxMnwR7WIdoPxWGjSwL8E/CjBZHP
   YU4vgZ7XJZV+4ozfLu8QpjPN1NWvm1Ew1eD4sjSubDI9uSRn789znyIGb
   OMtD0J1/lGmdFbRlcy35gji5qRPP5MORSfLWI7SQiKJOE2I1NI4Si3nOl
   lhaknadOOTjBNXaQJ9UfU7mc5tf9jNFisPB0t6CaCRiRGb0CrIx2L8BSH
   oBt3oVfgG+ryssiHA1rVQ6x1ypJjQJF+AKEAHLv3ovDrlskccxVPJHKnS
   wJ965FFxVfWNEakc//uc/hupIZSk3Y6nXZ0Nwzx69EM2D6gtKAlJieG+b
   A==;
X-CSE-ConnectionGUID: AfuXZVvTQlmB2vo9WxWQ/g==
X-CSE-MsgGUID: wKE3z6PEQ6O5G5YcO9AZmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4286730"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4286730"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 06:54:50 -0800
X-CSE-ConnectionGUID: PxtibhPJSKmnDOT9/tyFpQ==
X-CSE-MsgGUID: UJ7ef2gLQyOdJg1+ld6TTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11580685"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Nov 2026 06:54:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVruv-00000001PWc-2TTJ;
	Tue, 24 Nov 2026 14:54:45 +0000
Date: Tue, 24 Nov 2026 22:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 9319a10354bcc64da8fe41676254563aca1aca9e
Message-ID: <20261124225409.qdqSefHC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 9319a10354bcc64da8fe41676254563aca1aca9e  Merge branch 'renesas-next', tag 'v7.4-rc4' into renesas-devel

elapsed time: 1338m

configs tested: 394
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261123    gcc-8.5.0
alpha                 randconfig-2001-20261123    gcc-8.5.0
alpha                 randconfig-2200-20261123    gcc-12.5.0 smatch
alpha                randconfig-r2106-20261123    gcc-14.4.0 cocci
alpha                randconfig-r2111-20261123    gcc-8.5.0  cocci
alpha                randconfig-r2301-20261123    gcc-11.5.0 sparse
alpha                randconfig-r2305-20261123    gcc-11.5.0 sparse
alpha                randconfig-r2305-20261123    gcc-14.4.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261124    clang-24
arc                   randconfig-1001-20261124    clang-24
arc                   randconfig-2000-20261123    gcc-12.5.0
arc                   randconfig-2000-20261124    gcc-11.5.0
arc                   randconfig-2001-20261123    gcc-12.5.0
arc                   randconfig-2001-20261124    gcc-11.5.0
arc                   randconfig-2002-20261123    gcc-12.5.0
arc                   randconfig-2002-20261124    gcc-11.5.0
arc                   randconfig-2003-20261123    gcc-12.5.0
arc                   randconfig-2003-20261124    gcc-11.5.0
arc                   randconfig-2004-20261123    gcc-12.5.0
arc                   randconfig-2004-20261124    gcc-11.5.0
arc                   randconfig-2005-20261123    gcc-12.5.0
arc                   randconfig-2005-20261124    gcc-11.5.0
arc                   randconfig-2200-20261123    gcc-12.5.0 smatch
arc                   randconfig-2200-20261124    gcc-8.5.0  smatch
arc                  randconfig-r2102-20261123    gcc-8.5.0  cocci
arc                  randconfig-r2104-20261123    gcc-8.5.0  cocci
arc                  randconfig-r2108-20261123    gcc-14     cocci
arc                  randconfig-r2109-20261123    gcc-8.5.0  cocci
arc                  randconfig-r2300-20261123    gcc-11.5.0 sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    clang-17
arm                             mmp2_defconfig    clang-19
arm                              mxs_defconfig    clang-17
arm                            omap1_defconfig    clang-17
arm                   randconfig-1000-20261124    clang-24
arm                   randconfig-1001-20261124    clang-24
arm                   randconfig-1002-20261124    clang-24
arm                   randconfig-1003-20261124    clang-24
arm                   randconfig-2000-20261123    gcc-8.5.0
arm                   randconfig-2001-20261123    gcc-8.5.0
arm                   randconfig-2002-20261123    gcc-8.5.0
arm                   randconfig-2200-20261123    gcc-8.5.0  smatch
arm                   randconfig-2200-20261124    clang-17   smatch
arm                  randconfig-r2100-20261123    gcc-8.5.0  cocci
arm                  randconfig-r2101-20261123    gcc-8.5.0  cocci
arm                  randconfig-r2106-20261123    gcc-8.5.0  cocci
arm                  randconfig-r2107-20261123    gcc-14     cocci
arm                  randconfig-r2305-20261123    clang-22   sparse
arm                  randconfig-r2305-20261123    gcc-9.5.0  sparse
arm                  randconfig-r2307-20261123    gcc-8.5.0  sparse
arm                          s5pv210_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-2000-20261123    gcc-8.5.0
arm64                 randconfig-2001-20261123    gcc-8.5.0
arm64                 randconfig-2002-20261123    gcc-8.5.0
arm64                 randconfig-2200-20261123    clang-17   smatch
arm64                 randconfig-2200-20261124    gcc-16.2.0 smatch
arm64                randconfig-r2101-20261123    gcc-8.5.0  cocci
arm64                randconfig-r2109-20261123    clang-17   cocci
arm64                randconfig-r2302-20261123    clang-22   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-2000-20261123    gcc-12.5.0
csky                  randconfig-2001-20261123    gcc-12.5.0
csky                  randconfig-2200-20261123    gcc-16.2.0 smatch
csky                 randconfig-r2104-20261123    gcc-8.5.0  cocci
csky                 randconfig-r2105-20261123    gcc-8.5.0  cocci
csky                 randconfig-r2107-20261123    gcc-8.5.0  cocci
csky                 randconfig-r2111-20261123    clang-17   cocci
csky                 randconfig-r2300-20261123    clang-22   sparse
csky                 randconfig-r2311-20261123    gcc-8.5.0  sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261124    gcc-10.5.0
hexagon               randconfig-1001-20261124    gcc-10.5.0
hexagon               randconfig-2000-20261123    gcc-12.5.0
hexagon               randconfig-2001-20261123    gcc-12.5.0
hexagon               randconfig-2200-20261123    clang-24   smatch
hexagon              randconfig-r2100-20261123    gcc-8.5.0  cocci
hexagon              randconfig-r2309-20261123    gcc-12.5.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261124    gcc-12
i386        buildonly-randconfig-1001-20261124    gcc-12
i386        buildonly-randconfig-1002-20261124    gcc-12
i386        buildonly-randconfig-1003-20261124    gcc-12
i386        buildonly-randconfig-1004-20261124    gcc-12
i386        buildonly-randconfig-1005-20261124    gcc-12
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-2000-20261123    gcc-14
i386                  randconfig-2000-20261124    gcc-14
i386                  randconfig-2001-20261123    gcc-14
i386                  randconfig-2001-20261124    gcc-14
i386                  randconfig-2002-20261123    gcc-14
i386                  randconfig-2002-20261124    gcc-14
i386                  randconfig-2003-20261123    gcc-14
i386                  randconfig-2003-20261124    gcc-14
i386                  randconfig-2004-20261123    gcc-14
i386                  randconfig-2004-20261124    gcc-14
i386                  randconfig-2005-20261123    gcc-14
i386                  randconfig-2005-20261124    gcc-14
i386                  randconfig-2100-20261123    clang-22   cocci
i386                  randconfig-2101-20261123    clang-22   cocci
i386                  randconfig-2102-20261123    clang-22   cocci
i386                  randconfig-2103-20261123    clang-22   cocci
i386                  randconfig-2104-20261123    clang-22   cocci
i386                  randconfig-2105-20261123    clang-22   cocci
i386                  randconfig-2200-20261123    gcc-14     smatch
i386                  randconfig-2300-20261123    gcc-14     sparse
i386                  randconfig-2301-20261123    gcc-14     sparse
i386                  randconfig-2302-20261123    gcc-14     sparse
i386                 randconfig-r2104-20261123    gcc-8.5.0  cocci
i386                 randconfig-r2108-20261123    gcc-8.5.0  cocci
i386                 randconfig-r2303-20261123    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261124    gcc-10.5.0
loongarch             randconfig-1001-20261124    gcc-10.5.0
loongarch             randconfig-2000-20261123    gcc-16.2.0
loongarch             randconfig-2001-20261123    gcc-16.2.0
loongarch             randconfig-2200-20261123    clang-24   smatch
loongarch             randconfig-2200-20261124    gcc-16.2.0 smatch
loongarch            randconfig-r2100-20261123    gcc-8.5.0  cocci
loongarch            randconfig-r2106-20261123    clang-17   cocci
loongarch            randconfig-r2108-20261123    clang-17   cocci
loongarch            randconfig-r2300-20261123    gcc-14.4.0 sparse
loongarch            randconfig-r2302-20261123    gcc-11.5.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5307c3_defconfig    clang-17
m68k                        m5475evb_defconfig    clang-17
m68k                  randconfig-2000-20261123    gcc-8.5.0
m68k                  randconfig-2001-20261123    gcc-8.5.0
m68k                  randconfig-2200-20261123    gcc-8.5.0  smatch
m68k                 randconfig-r2101-20261123    gcc-8.5.0  cocci
m68k                 randconfig-r2301-20261123    gcc-14.4.0 sparse
m68k                 randconfig-r2310-20261123    gcc-12.5.0 sparse
m68k                            sun3_defconfig    clang-17
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261123    gcc-8.5.0
microblaze            randconfig-2200-20261123    gcc-16.2.0 smatch
microblaze           randconfig-r2103-20261123    gcc-8.5.0  cocci
microblaze           randconfig-r2110-20261123    clang-17   cocci
microblaze           randconfig-r2306-20261123    gcc-12.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           eyeq6_defconfig    clang-17
mips                            ip22_defconfig    clang-19
mips                  randconfig-2000-20261123    gcc-10.5.0
mips                  randconfig-2001-20261123    gcc-10.5.0
mips                  randconfig-2002-20261123    gcc-10.5.0
mips                  randconfig-2200-20261123    gcc-14.4.0 smatch
mips                  randconfig-2200-20261124    clang-20   smatch
mips                 randconfig-r2103-20261123    gcc-8.5.0  cocci
mips                 randconfig-r2304-20261123    gcc-11.5.0 sparse
mips                 randconfig-r2311-20261123    gcc-12.5.0 sparse
mips                            xway_defconfig    clang-19
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261124    gcc-10.5.0
nios2                 randconfig-1001-20261124    gcc-10.5.0
nios2                 randconfig-2000-20261123    gcc-16.2.0
nios2                 randconfig-2001-20261123    gcc-16.2.0
nios2                 randconfig-2200-20261123    gcc-8.5.0  smatch
nios2                randconfig-r2102-20261123    gcc-8.5.0  cocci
nios2                randconfig-r2105-20261123    gcc-8.5.0  cocci
nios2                randconfig-r2300-20261123    gcc-9.5.0  sparse
nios2                randconfig-r2303-20261123    gcc-11.5.0 sparse
nios2                randconfig-r2308-20261123    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261123    gcc-10.5.0
openrisc              randconfig-2001-20261123    gcc-10.5.0
openrisc              randconfig-2002-20261123    gcc-10.5.0
openrisc              randconfig-2200-20261123    gcc-12.5.0 smatch
openrisc              randconfig-2200-20261124    gcc-11.5.0 smatch
openrisc             randconfig-r2110-20261123    gcc-14     cocci
openrisc             randconfig-r2303-20261123    gcc-9.5.0  sparse
openrisc             randconfig-r2306-20261123    gcc-8.5.0  sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-32bit_defconfig    clang-17
parisc                randconfig-1000-20261124    clang-24
parisc                randconfig-1001-20261124    clang-24
parisc                randconfig-2000-20261123    gcc-16.2.0
parisc                randconfig-2001-20261123    gcc-16.2.0
parisc                randconfig-2200-20261123    gcc-14.4.0 smatch
parisc               randconfig-r2100-20261123    gcc-8.5.0  cocci
parisc               randconfig-r2104-20261123    gcc-8.5.0  cocci
parisc               randconfig-r2106-20261123    gcc-14     cocci
parisc               randconfig-r2109-20261123    gcc-14.4.0 cocci
parisc               randconfig-r2110-20261123    gcc-8.5.0  cocci
parisc               randconfig-r2303-20261123    gcc-14.4.0 sparse
parisc               randconfig-r2307-20261123    gcc-12.5.0 sparse
parisc               randconfig-r2310-20261123    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    clang-19
powerpc                       bamboo_defconfig    clang-19
powerpc                        ebony_defconfig    clang-19
powerpc                         icon_defconfig    clang-17
powerpc                   mpc866_ads_defconfig    clang-17
powerpc                        ppc64_defconfig    clang-17
powerpc               randconfig-1000-20261124    clang-24
powerpc               randconfig-1001-20261124    clang-24
powerpc               randconfig-2000-20261123    clang-21
powerpc               randconfig-2000-20261124    clang-24
powerpc               randconfig-2001-20261123    clang-21
powerpc               randconfig-2001-20261124    clang-24
powerpc               randconfig-2002-20261123    clang-21
powerpc               randconfig-2002-20261124    clang-24
powerpc               randconfig-2200-20261123    gcc-9.5.0  smatch
powerpc              randconfig-r2111-20261123    gcc-14     cocci
powerpc              randconfig-r2301-20261123    gcc-9.5.0  sparse
powerpc                      skiroot_defconfig    clang-17
powerpc                      tqm8560_defconfig    clang-19
powerpc64             randconfig-1000-20261124    clang-24
powerpc64             randconfig-1001-20261124    clang-24
powerpc64             randconfig-2000-20261123    clang-21
powerpc64             randconfig-2000-20261124    clang-24
powerpc64             randconfig-2001-20261123    clang-21
powerpc64             randconfig-2001-20261124    clang-24
powerpc64             randconfig-2002-20261123    clang-21
powerpc64             randconfig-2002-20261124    clang-24
powerpc64             randconfig-2200-20261123    gcc-15.3.0 smatch
powerpc64            randconfig-r2102-20261123    gcc-8.5.0  cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-17
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261124    gcc-11.5.0
riscv                 randconfig-1001-20261124    gcc-11.5.0
riscv                 randconfig-2000-20261123    gcc-11.5.0
riscv                 randconfig-2001-20261123    gcc-11.5.0
riscv                 randconfig-2002-20261123    gcc-11.5.0
riscv                 randconfig-2003-20261123    gcc-11.5.0
riscv                 randconfig-2004-20261123    gcc-11.5.0
riscv                 randconfig-2005-20261123    gcc-11.5.0
riscv                 randconfig-2200-20261123    clang-17   smatch
riscv                randconfig-r2108-20261123    gcc-14.4.0 cocci
riscv                randconfig-r2110-20261123    gcc-14.4.0 cocci
riscv                randconfig-r2111-20261123    gcc-14.4.0 cocci
riscv                randconfig-r2301-20261123    clang-22   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261124    gcc-11.5.0
s390                  randconfig-1001-20261124    gcc-11.5.0
s390                  randconfig-2000-20261123    clang-20
s390                  randconfig-2001-20261123    clang-20
s390                  randconfig-2002-20261123    clang-20
s390                  randconfig-2003-20261123    clang-20
s390                  randconfig-2004-20261123    clang-20
s390                  randconfig-2005-20261123    clang-20
s390                  randconfig-2200-20261123    clang-24   smatch
s390                 randconfig-r2103-20261123    gcc-8.5.0  cocci
s390                        zfcpdump_defconfig    clang-19
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261124    gcc-11.5.0
sh                    randconfig-1001-20261124    gcc-11.5.0
sh                    randconfig-2000-20261123    gcc-16.2.0
sh                    randconfig-2001-20261123    gcc-16.2.0
sh                    randconfig-2002-20261123    gcc-16.2.0
sh                    randconfig-2003-20261123    gcc-16.2.0
sh                    randconfig-2004-20261123    gcc-16.2.0
sh                    randconfig-2005-20261123    gcc-16.2.0
sh                    randconfig-2200-20261123    gcc-16.2.0 smatch
sh                   randconfig-r2107-20261123    gcc-14.4.0 cocci
sh                   randconfig-r2302-20261123    gcc-9.5.0  sparse
sh                    sh7770_generic_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261124    clang-24
sparc                 randconfig-1001-20261124    clang-24
sparc                 randconfig-2000-20261123    gcc-9.5.0
sparc                 randconfig-2001-20261123    gcc-9.5.0
sparc                 randconfig-2200-20261123    gcc-12.5.0 smatch
sparc                randconfig-r2304-20261123    clang-22   sparse
sparc                randconfig-r2304-20261123    gcc-9.5.0  sparse
sparc                randconfig-r2309-20261123    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261124    clang-24
sparc64               randconfig-1001-20261124    clang-24
sparc64               randconfig-2000-20261123    gcc-9.5.0
sparc64               randconfig-2001-20261123    gcc-9.5.0
sparc64               randconfig-2200-20261123    clang-22   smatch
sparc64              randconfig-r2107-20261123    clang-17   cocci
sparc64              randconfig-r2302-20261123    gcc-14.4.0 sparse
sparc64              randconfig-r2304-20261123    gcc-14.4.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261124    clang-24
um                    randconfig-1001-20261124    clang-24
um                    randconfig-2000-20261123    gcc-9.5.0
um                    randconfig-2001-20261123    gcc-9.5.0
um                    randconfig-2200-20261123    clang-21   smatch
um                   randconfig-r2103-20261123    gcc-8.5.0  cocci
um                   randconfig-r2105-20261123    gcc-8.5.0  cocci
um                   randconfig-r2109-20261123    gcc-14     cocci
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261124    gcc-14
x86_64      buildonly-randconfig-1001-20261124    gcc-14
x86_64      buildonly-randconfig-1002-20261124    gcc-14
x86_64      buildonly-randconfig-1003-20261124    gcc-14
x86_64      buildonly-randconfig-1004-20261124    gcc-14
x86_64      buildonly-randconfig-1005-20261124    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261124    gcc-12
x86_64                randconfig-1001-20261124    gcc-12
x86_64                randconfig-1002-20261124    gcc-12
x86_64                randconfig-1003-20261124    gcc-12
x86_64                randconfig-1004-20261124    gcc-12
x86_64                randconfig-1005-20261124    gcc-12
x86_64                randconfig-2000-20261123    gcc-14
x86_64                randconfig-2000-20261124    gcc-14
x86_64                randconfig-2001-20261123    gcc-14
x86_64                randconfig-2001-20261124    gcc-14
x86_64                randconfig-2002-20261123    gcc-14
x86_64                randconfig-2002-20261124    gcc-14
x86_64                randconfig-2003-20261123    gcc-14
x86_64                randconfig-2003-20261124    gcc-14
x86_64                randconfig-2004-20261123    gcc-14
x86_64                randconfig-2004-20261124    gcc-14
x86_64                randconfig-2005-20261123    gcc-14
x86_64                randconfig-2005-20261124    gcc-14
x86_64                randconfig-2100-20261123    clang-22   cocci
x86_64                randconfig-2101-20261123    clang-22   cocci
x86_64                randconfig-2102-20261123    clang-22   cocci
x86_64                randconfig-2103-20261123    clang-22   cocci
x86_64                randconfig-2104-20261123    clang-22   cocci
x86_64                randconfig-2105-20261123    clang-22   cocci
x86_64                randconfig-2200-20261123    gcc-14     smatch
x86_64                randconfig-2300-20261123    gcc-14     sparse
x86_64                randconfig-2301-20261123    gcc-14     sparse
x86_64                randconfig-2302-20261123    gcc-14     sparse
x86_64               randconfig-r2105-20261123    gcc-8.5.0  cocci
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261124    clang-24
xtensa                randconfig-1001-20261124    clang-24
xtensa                randconfig-2000-20261123    gcc-12.5.0
xtensa                randconfig-2001-20261123    gcc-12.5.0
xtensa                randconfig-2200-20261123    gcc-8.5.0  smatch
xtensa               randconfig-r2101-20261123    gcc-8.5.0  cocci
xtensa               randconfig-r2308-20261123    gcc-12.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
