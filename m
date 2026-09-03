Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86062110E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 04:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408592; cv=none; b=e04akwfFWCr0POgD7W7U89UkPFe040zoiPy+1Kr7ycNfhepr9uVl8CMWOiwhw4EHwkCJtMtOZRuHt3UW+BDiCR0XBI6X19ofPpWLtPEXWhGX2H80dK8uXoCxpxUm8zLr5BbFGRP/wSVqMzV9dKwDPYhR5y8HtMHu8I4PadQ0Rs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408592; c=relaxed/simple;
	bh=JjHJYFodV3n3WuADWYRtuAJSPuiKOqDSyv9Q9tXAXJo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N4XE6w97wFdtxKgsKabICn0R2ZzXtmyuom5gTz1CmeyyXYyjzspbMbFsJdivTM1GnekhDoLstDgnJHk82HDlpQf/wSe5nnSYBhqsMJX0PhKLnx1hc1DcRPtnZEdYKpc9P0/tq4DRY8eLcyHfG8LxXJcb14uBxpSsO7ZiBgbtmNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZbvydIQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZbvydIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788408591; x=1819944591;
  h=date:from:to:cc:subject:message-id;
  bh=JjHJYFodV3n3WuADWYRtuAJSPuiKOqDSyv9Q9tXAXJo=;
  b=AZbvydIQlQMmDlmSr5bmdbhN7kEZI7ghC4GykBdivx+Qj2p8EACsZIpz
   wUhds8F+NUu5uYLI2gPBop5PTIlpp9aI/jp1/FeZS7RY26iPBJivlpMQ0
   pwQnDBw8QEiiJgQ4bYuyWRbdUiga+wGG71SQuVZ9hWbCHqw84wGtEtObC
   cauyjT3D6MTKcqQLT5miZ/Z9LvUE7Ik3sXnPckhLhh36zpviL8/R05gmU
   JfFPFGJgKC5Z+JvaYrLY1MS1LhttbJSI3NjZzgcR2rz0UKvar/IGrqB45
   W2sjkoFdtqecxxLYrO81gUx4GUb3FS5KKlvzv8EQFTX5+E/Xq1igopwZV
   g==;
X-CSE-ConnectionGUID: qUdPofZYTtSl3UD/JCne2A==
X-CSE-MsgGUID: JOwF+sF9QxeaKIwyfrw1XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88642901"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88642901"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 21:09:51 -0700
X-CSE-ConnectionGUID: xZj+WIQmSjWugJyk3FEvRw==
X-CSE-MsgGUID: xWY7myQ2SniOjZZEl9MbyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="271555770"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Sep 2026 21:09:49 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1ylm-0000000040u-0hmA;
	Thu, 03 Sep 2026 04:09:46 +0000
Date: Thu, 03 Sep 2026 12:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 26e80ec751c87f437650a2f9eed5ef3ec436bf0b
Message-ID: <202609031233.MmSIj76I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 26e80ec751c87f437650a2f9eed5ef3ec436bf0b  clk: renesas: Make sure clk_init_data is fully initialized

elapsed time: 2669m

configs tested: 87
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                    allnoconfig    gcc-16.1.0
alpha                   allyesconfig    gcc-16.1.0
alpha       randconfig-r054-20260902    clang-22
arc                     allmodconfig    clang-24
arc                      allnoconfig    gcc-16.1.0
arc                     allyesconfig    clang-24
arc         randconfig-r122-20260901    clang-24
arm                      allnoconfig    gcc-16.1.0
arm                     allyesconfig    clang-24
arm         randconfig-r052-20260902    clang-22
arm         randconfig-r112-20260901    clang-24
arm64                   allmodconfig    clang-24
arm64                    allnoconfig    gcc-16.1.0
arm64       randconfig-r053-20260902    clang-24
csky                    allmodconfig    gcc-16.1.0
csky                     allnoconfig    gcc-16.1.0
csky        randconfig-r061-20260902    clang-22
csky        randconfig-r062-20260902    clang-22
csky        randconfig-r072-20260902    gcc-14.3.0
hexagon                 allmodconfig    gcc-16.1.0
hexagon                  allnoconfig    gcc-16.1.0
hexagon     randconfig-r071-20260902    clang-24
i386                    allmodconfig    clang-22
i386                     allnoconfig    gcc-16.1.0
i386                    allyesconfig    clang-22
i386         randconfig-051-20260902    clang-22
i386         randconfig-052-20260902    clang-22
i386         randconfig-053-20260902    clang-22
i386         randconfig-054-20260902    clang-22
i386         randconfig-141-20260901    gcc-14
i386         randconfig-141-20260902    clang-22
i386        randconfig-r063-20260902    clang-22
loongarch               allmodconfig    clang-24
loongarch                allnoconfig    gcc-16.1.0
m68k                    allmodconfig    gcc-16.1.0
m68k                     allnoconfig    gcc-16.1.0
m68k                    allyesconfig    clang-24
microblaze               allnoconfig    gcc-16.1.0
microblaze              allyesconfig    gcc-16.1.0
microblaze  randconfig-r113-20260901    clang-24
mips                    allmodconfig    gcc-16.1.0
mips                     allnoconfig    gcc-16.1.0
mips                    allyesconfig    gcc-16.1.0
mips        randconfig-r134-20260902    gcc-13.4.0
nios2                   allmodconfig    clang-20
nios2                    allnoconfig    clang-24
nios2       randconfig-r072-20260902    gcc-8.5.0
nios2       randconfig-r111-20260901    clang-24
nios2       randconfig-r123-20260901    clang-24
openrisc                allmodconfig    clang-20
openrisc                 allnoconfig    clang-24
openrisc    randconfig-r053-20260902    clang-22
openrisc    randconfig-r064-20260902    clang-22
openrisc    randconfig-r071-20260902    gcc-16.1.0
parisc                  allmodconfig    gcc-16.1.0
parisc                   allnoconfig    clang-24
parisc                  allyesconfig    clang-17
parisc      randconfig-r054-20260902    clang-24
powerpc                 allmodconfig    gcc-16.1.0
powerpc                  allnoconfig    clang-24
powerpc     randconfig-r132-20260902    gcc-13.4.0
powerpc     randconfig-r133-20260902    gcc-13.4.0
riscv                   allmodconfig    clang-24
riscv                    allnoconfig    clang-24
riscv                   allyesconfig    clang-24
riscv       randconfig-r051-20260902    clang-22
s390                    allmodconfig    clang-17
s390                     allnoconfig    clang-24
s390                    allyesconfig    gcc-16.1.0
sh                      allmodconfig    gcc-16.1.0
sh                       allnoconfig    clang-24
sh                      allyesconfig    clang-17
sh          randconfig-r121-20260901    clang-24
sparc                    allnoconfig    clang-24
sparc       randconfig-r052-20260902    clang-24
sparc64                 allmodconfig    clang-20
sparc64     randconfig-r051-20260902    clang-24
sparc64     randconfig-r131-20260902    gcc-13.4.0
um                      allmodconfig    clang-17
um                       allnoconfig    clang-24
um                      allyesconfig    gcc-16.1.0
x86_64                  allmodconfig    clang-22
x86_64                   allnoconfig    clang-24
x86_64                  allyesconfig    clang-22
x86_64                 rhel-9.4-rust    clang-22
xtensa                   allnoconfig    clang-24
xtensa                  allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
