Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E3D381B16
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 19:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788551705; cv=none; b=mxMEgidzXOxAjrvC2ONU1s0YTgyye1RlGIqEZVNf/RtC3OHn8+b6GhZaLbraapobVDKqxY8Rs0f1Jx9zg50Jn8OUR3Pi4RbeGjWVc91eCVAeoR+T0k1cd3uTCMmHmh82jWbW2+fO7dcrvdRLwwgig6M3DwTN9Lx2/K2nPFWr2Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788551705; c=relaxed/simple;
	bh=0gnc1kZ9sQ+FXT8yaX8TsZHQQxDnTHJ7webx148sZ2M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i4rEzT1R80W1/JMkyxrMAZUKiRZRQM73frvA8XkSPAY4lRkGY5bDfKFhSPgKMxX9VpFrWMY9jfiLm0Hdecz2G47IxGpethqR6Dd+24ik+4D44cOc62bn0ZFe3A/pE5n9VpuCVvD5eOdhQOm3IJLZUtqf3bC+RUsbGaEgWX6K+wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTykU8wo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTykU8wo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788551700; x=1820087700;
  h=date:from:to:cc:subject:message-id;
  bh=0gnc1kZ9sQ+FXT8yaX8TsZHQQxDnTHJ7webx148sZ2M=;
  b=BTykU8woSgXc6LHiu4vP1n9lOG4Ocr7FykxUn0YMCY+Seq5NyIyL85Qk
   Wn8HeHE0nzX0/JxPYfLxXAoEcpVDpy45I7wrAioZGqZCEhYuvu1KfDiVG
   WlmVGAFZ9oCRS2XsX+qYRJQ3Wcu3+xpyGAV2YnV0GB5iat5Ul5A8AtdR9
   Q4o8sDEtoxrWG2FeXRs4aPUpgD/V1ctNRPP8hLC465OFvEME17A+CoIUL
   EycOxYiVizDyJtbev07lPkZqlQwnKFveftRyPCtK7bFZf46211DhCdKQY
   tSGFLspL5+rPwZC3WQn9rowyGzOevMCdA6PmPbm06rDs8G1xgnKfQXrDW
   g==;
X-CSE-ConnectionGUID: J1PWcjk6R6Ce7hSkBKGxpQ==
X-CSE-MsgGUID: yadFa1rmTqO0B9Y+edSlRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89267451"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="89267451"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 12:54:59 -0700
X-CSE-ConnectionGUID: 7BFkerd7T421bNywoe92Iw==
X-CSE-MsgGUID: r6GcECstQTy0Cq2wCgAcgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="272068022"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Sep 2026 12:54:57 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2Zzy-00000000A7S-3WwV;
	Fri, 04 Sep 2026 19:54:54 +0000
Date: Sat, 05 Sep 2026 03:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v7.4] BUILD SUCCESS
 529b0be30bd97dde9fe71c0cc406e252ab1362fe
Message-ID: <202609050304.lFb0gTPk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v7.4
branch HEAD: 529b0be30bd97dde9fe71c0cc406e252ab1362fe  soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for R9A08G046

elapsed time: 3279m

configs tested: 64
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
