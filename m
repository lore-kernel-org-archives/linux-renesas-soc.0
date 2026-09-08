Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888454BAA11
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 12:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869460; cv=none; b=Czc/65PvtwdED5QbZuzI338tpxOxzWK2ktk8+jSigI1cd+pwfERUIfm0HFPMWQslhk4B3GdyOVkrDWO8i5qYqVi9I/B7PSWOcxC6gxZj3ieD9YET6PGIi8NsYXBhky24g/D+aEGXTlMlUmKfsp2y0kxbTODIZMtKhgR1IdGTVAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869460; c=relaxed/simple;
	bh=Exd7/quJU/SYkLxILprQPXh2igyis04C1LEpqF/y5cg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hHSayHSHubKnhDWb3MCXueCjmtQKVCi+Pyvh+eyQ8EgK66cXOIeCFOsQci2GBDNiPrs7MPprIomgd8krqmIkrBlJ0VJ7+aNs5k0b0FpjmvStw4aVy5raFhjkltPXndMYjleEt0KBYcGzwW+w6Ze+A3iHPMiNSm6pVW58W+L8f0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdbEbEvc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdbEbEvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788869455; x=1820405455;
  h=date:from:to:cc:subject:message-id;
  bh=Exd7/quJU/SYkLxILprQPXh2igyis04C1LEpqF/y5cg=;
  b=JdbEbEvcnT3FZkj06uMPJlfVg5Xiru/VAmHwcrCrVOGoDffoGpX8Gu9J
   bb4rTA6Xy+lsPA0SLKqzp9dwlKV44nGWlFVFa2wM96WEz7+KcqyOJsF5D
   4QsoPcNkXgCc5qYu9SYBWNNzA0+ie4hfAJyfOAHTxv1a6LFN/18jYkYXr
   DAQHi9IWfbJor8Mqk4ScvS0N8hAsTJ830yr/eBpraXHXmq9X2feNIOF//
   uWyWXLh808ebTm7/HrAQJW7T1IN2dSmVCZ5U3GN1qqv0jFO3jc71+Gahq
   CguLVXKhnGBGlTXpIyyXsur32kdUlPwsIXUBh7ZXMZYL1sp7TCPCoUwXw
   w==;
X-CSE-ConnectionGUID: XH+CrEprQo+Wi6fcRaSYiA==
X-CSE-MsgGUID: 3ta4Nf/BSi6dkAn8fl7o/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106639673"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="106639673"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 05:10:35 -0700
X-CSE-ConnectionGUID: XlQn+GDORF+ztFHmXw1eow==
X-CSE-MsgGUID: 6LfKaST+T5OIsK1TB0mcDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="264773398"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2026 05:10:33 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3uek-0000000005l-3Dbu;
	Tue, 08 Sep 2026 12:10:30 +0000
Date: Tue, 08 Sep 2026 20:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 edabbfb616a89a0b783d9ef3936c964d2a1143ae
Message-ID: <202609082043.KbMKfErF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: edabbfb616a89a0b783d9ef3936c964d2a1143ae  clk: renesas: rzv2h: Convert to clk_hw based provider API

elapsed time: 1554m

configs tested: 83
configs skipped: 8

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
loongarch    allmodconfig    clang-19
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
