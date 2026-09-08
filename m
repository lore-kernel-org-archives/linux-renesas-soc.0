Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BF2538D63
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 12:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869450; cv=none; b=RNJwPlGHHnVjxn0UBn/xQQetN63VcymuQgaRhv5/mAdjCeyGhXpi42qZ9fPxHH/HJQm6RDRKXzW7qxZU/U+R1WQddv4wqM4stVQV6y1ntuWpWQsuhCcb6ibrF5uk0J6wObEq2Jaog27z2Xp5097AlgT78YbZE8xbipzby+J8Hb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869450; c=relaxed/simple;
	bh=b0p9GPYd3oqsoTfTafPRuOde+smwgdfvvMCKy562coI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K+n81X0pLcGsZxNIhQrTKCLJKyreF2qYIbm9Cc46MAbctGsVbDUwE1CK/Hgo4mApdTy8tokB2SQ7TqgPqSczq0gcaubRGymH3PZe6n1gDP7F4A4boz9qQ1RpkF3UjXFWIOtTlL6y3/hVP7Q4VNeZRZtzjtnWYw6piAOi2ELcchQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDJPLZYN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDJPLZYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788869440; x=1820405440;
  h=date:from:to:cc:subject:message-id;
  bh=b0p9GPYd3oqsoTfTafPRuOde+smwgdfvvMCKy562coI=;
  b=FDJPLZYNc7Bsz2UZQ8SNRuLFG80K8FWMy92iaINUZPClOdzQrzUF/5N4
   ZgT0i9FGUHMoC7BcWqdG7Yj0o1Xkt3yHU4ZS1Iv3HU0zZVnHK+Tmqy2e8
   Ru1Q5RWEpcXpwj1dNlqIETlFxAG3X3ab3poohv3KIUhlhasgEda5PnXQq
   Dk7b2vvSN2cC6y7gkat9EV9jj0sPI6GosyIE7Qv+1MVhMTBCfbsmMDy3Q
   Vq73cR3CUbr6b30IjAXhE6o/cULKqhu1/RPSIU8KlcHNzRxHw68DaJUOd
   Hazop5w/lNljOrVcKTimpgawcASH7rWZXObvq2fNnoYeFzz96GzNOzoHr
   Q==;
X-CSE-ConnectionGUID: MYIk+27LQ/OIWVPwoIU3Qg==
X-CSE-MsgGUID: RXuNyB/HT0GaNfpryy8BkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106639671"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="106639671"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 05:10:35 -0700
X-CSE-ConnectionGUID: hjgcrAkWTk2r6fOMy0zkfw==
X-CSE-MsgGUID: +V93qo+7TUaX/sC1WqCazQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="264773397"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2026 05:10:33 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3uek-0000000005j-38ks;
	Tue, 08 Sep 2026 12:10:30 +0000
Date: Tue, 08 Sep 2026 20:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v7.4] BUILD SUCCESS
 10eeafc3e90ebbe6627a7d471b86af889d7b07e5
Message-ID: <202609082034.XpXVOqAt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v7.4
branch HEAD: 10eeafc3e90ebbe6627a7d471b86af889d7b07e5  soc: renesas: rcar-rst: Add support for RZ/G2M v3.0

elapsed time: 1554m

configs tested: 81
configs skipped: 3

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
