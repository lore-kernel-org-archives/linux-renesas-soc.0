Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C905478D
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Sep 2026 05:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788586448; cv=none; b=sIOkqhFFsiGo+HFOyCiooQIfbRDUwh8zV0QthwyqEqUEykckFmGVH2VB8y5M5kEoVtoaNrnlmVBYLQz8faONcmTBUanaNGlDtcpkk4kmt31DV8ExiN1RmU5fdEZIKDaqvwUSnwyj5Sp/49geZ/hslm709VKpnMEO8tmKghtOGBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788586448; c=relaxed/simple;
	bh=wbtDXcEavxHUEMBdbRq656/KSA2aBm0d0vXspJPparc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f/WJxfqk9ocnDn6N6KaP8ZXpHwrfju3lwX6zi6zJfS8i5NVmNI39LXBrNoDK83pJnBFJxYKDYVV1kJOt6v1O5xSUyhfesxIJR66Y/WWu1SsbJ4Bh4RXnngmB7K9fu2ltupLe7OaF6F4fRN5KSiU0hOsR8dC8LKC6u9+ML18R2g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYEleMXq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYEleMXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788586445; x=1820122445;
  h=date:from:to:cc:subject:message-id;
  bh=wbtDXcEavxHUEMBdbRq656/KSA2aBm0d0vXspJPparc=;
  b=TYEleMXqaLinOM6xNBPgd7+WvJ8xwJ9pt52SUrTwdnyBk1at3/DXWk/1
   C3q5+EESA8Ak8MGyB/HlTWS6JNPEr+oyYVB/idClLY82NXGqZ/sp60CiL
   g0ZjalGvm3KwAangeyOrKNd7/wVZngJWOHV/JPUmHtgXezOBZIWRaw6dy
   RJW70OkI/f3kaiKMoknnhRNBL/IFKCMu8GZqyo54dx81a1EPVN8+OOgP1
   1Vr7hks/h0IEx3yjYU71ECA5wghYLCZD/a3B9TgzQ5hF4f14d2NTriQ57
   yOovHNkFcHlY+MTvQbE/2Gb3wyRowqsr2QVHzOkbb6OYhSOfXgmUi6RWP
   w==;
X-CSE-ConnectionGUID: 0KCyN4BjR/6Jps0PksjOkg==
X-CSE-MsgGUID: Ov2upbh7RRe5lP5VUaSuJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="111859111"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="111859111"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 22:34:05 -0700
X-CSE-ConnectionGUID: X8tjyN4TRbey6XXfhLji1w==
X-CSE-MsgGUID: NGCoQINgSeeEzjI9yDGaLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="264027516"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Sep 2026 22:34:03 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2j2N-0000000005L-3MM6;
	Sat, 05 Sep 2026 05:34:00 +0000
Date: Sat, 05 Sep 2026 13:33:08 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 69a48251360a95c33775e3cdd25a72fb23c88186
Message-ID: <202609051305.uO4aMTUf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 69a48251360a95c33775e3cdd25a72fb23c88186  Merge branch 'renesas-next' into renesas-devel

elapsed time: 3859m

configs tested: 74
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-24
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
nios2        allmodconfig    clang-20
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
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
riscv        allmodconfig    clang-24
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
