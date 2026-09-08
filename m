Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674F253358F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 12:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869378; cv=none; b=vFsC00Hd/07xbBcDMDzhQ3p4i3wZ73hp4PW9iI5GZhgQ3AOmJmBqfElaN5GAPVK2RBBKGKRmBZY7jGu1DRrqU61z+wkyiWeu8w4fioUL9IgcbqoQa/JBbC4p30c/Vz1pjfExI7FWXvEt5K3jmldU3mnZIW/5ttUAASHuAA6v/xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869378; c=relaxed/simple;
	bh=xhmNvzPPgnVc3X5ecm7EVzVh+RRiLdxi5TX9YCmP2Fw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B0mN8jJLxmjoWiO4DgJnm4vLKq1YRNOgdnYC18F2T1Fz4Plx8SW2oAD0RaZDrNZsuXY+4HTq2SsdLeP6fKRgb63sR3nIT6+BLniWXHBGlwYduedRvVC85aEKOuCQG2QzZHzVuc5W3V8v15n3q0PlP/Q3ECyYX3S64AMkOpYzdBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgpQP7LV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgpQP7LV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788869375; x=1820405375;
  h=date:from:to:cc:subject:message-id;
  bh=xhmNvzPPgnVc3X5ecm7EVzVh+RRiLdxi5TX9YCmP2Fw=;
  b=VgpQP7LV7weF3egQUUU95bnmvi0uH58221s0VL4+94TRnW8MBv1U9foy
   9crC4BKhP03nE49VhBIdA64fzzPgqHxyOsTNW4X78EVlXGil1BlYXdy8Y
   hT6rs87ZtUibW7Y/n97GY9DhGrDhwZ4FAxPBgZmIc/BJdpr0QSof7zrZs
   biSGRSce3PtpQPBXxzv5OhhA3Tf/trSQivVL+QmSuC6bwuy/iOIivXXSC
   zLoQQhMwKpfh4pHgXAP5Rck7tvVV5M9U/FcCcRgolwgQOted9LGJPPYsY
   syb0V6u9teMxQzccfSrRNxbISQZZBeAakwitf4ihirWj7dE3HMkKm/GqL
   A==;
X-CSE-ConnectionGUID: 0EWilLmeRgKZ0eliFiRwgg==
X-CSE-MsgGUID: rYLYo2CfQIGbyWiYUmkGHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106784211"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="106784211"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 05:09:33 -0700
X-CSE-ConnectionGUID: KEcicor2Q1mc2o9PygHJkw==
X-CSE-MsgGUID: 5unYlv0lTJyQtl6Ez23kOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267728310"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Sep 2026 05:09:32 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3udm-0000000005H-0rJE;
	Tue, 08 Sep 2026 12:09:30 +0000
Date: Tue, 08 Sep 2026 20:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 c0ca80b66f2262166605540c5d5e545f127d5ce6
Message-ID: <202609082026.1aA6LDPp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: c0ca80b66f2262166605540c5d5e545f127d5ce6  Merge branch 'renesas-drivers-for-v7.4' into renesas-next

elapsed time: 1554m

configs tested: 82
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm          allyesconfig    gcc-16.1.0
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc     allmodconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
