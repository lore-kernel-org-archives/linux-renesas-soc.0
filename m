Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E2647CC80
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2026 11:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041391; cv=none; b=Un+eM3+4u2sUf221IjpHyS4M7oouRwo6lsjq58Am0WB4xXk8F1OFJgTpUrJIg0UtdZey4a8vfxSx7xhAZodnA9+3ThVDkleuuS2ke1o0++rtLJlqVRkHFfY93LV9RWoJexboOirTiFQ6se9za8Pc2UqZSIHMYXSDoKtDC7ueL6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041391; c=relaxed/simple;
	bh=wRbpWsOLTz7Te8t3HsBWOhyji28osxUzkS3VrGRJwQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tXfvtsAR6N5nW4KIJmJdlBmf3cNvbUx1Yme44f3vvIyskcwEkFaGbPXSYgc6SuS8klu69Bw8zE8uaHEjrDKBUu/0Afu6O1jeHroBgD6kURBAW0uVJVT13Fq/gGniWrFfBLrgeR1kdcFU03JF0I/67vECQuVky+2Muxldp3QYPQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrYZ8jD7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrYZ8jD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789041389; x=1820577389;
  h=date:from:to:cc:subject:message-id;
  bh=wRbpWsOLTz7Te8t3HsBWOhyji28osxUzkS3VrGRJwQs=;
  b=KrYZ8jD7uMnnRtP6EKc0hFnUEX3FKnnWmKzgFDGg7fFexgRFrX3Ewr4p
   kODNV7SxUe/39fgv+olmIDn384a7FPaw4cqIK5Nr35lQe6CBC2f555sNE
   +p4HGv7LNFJsYegBz8xyiNjxdR3SxsrmA/iQHI6KBwRYq6L44wJBhiGnh
   JhqOEwycvie6TPTyoof/1TZkt5BZRIV9roF9tNFtLz1l54/gbSk0CffiI
   eda+J92mlZOjIo0i2uCKLj8F5M1xtqt1uvEp/pzTTR4QhEZmIyxO/fMjE
   BeFM35W4Zil60f3jTfxmPuQHxyWRD1Uvac1ARZRVJWIWf1NmL7MDUvz4u
   w==;
X-CSE-ConnectionGUID: +eJz0ZKlQLqeiox7wDp+Fw==
X-CSE-MsgGUID: f2E4yy8gSBCRNMd1OGpzcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89528704"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89528704"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:56:29 -0700
X-CSE-ConnectionGUID: e1os+frfSYmHURfycZWCLQ==
X-CSE-MsgGUID: YTrBWUElRi6t+12+qJ8soA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="270261250"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2026 04:56:28 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4dOD-000000001lf-2dFp;
	Thu, 10 Sep 2026 11:56:25 +0000
Date: Thu, 10 Sep 2026 19:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD REGRESSION
 810b8b6c4e02c40991c29491cec09ebdaf5ec6d0
Message-ID: <202609101912.Y8YAZwHZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 810b8b6c4e02c40991c29491cec09ebdaf5ec6d0  clk: renesas: r9a09g077: Register SYSC regmap

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202609101334.xgbNoC4e-lkp@intel.com

    drivers/clk/renesas/r9a09g077-cpg.c:966:24: error: incompatible integer to pointer conversion initializing 'struct regmap_config *' with an expression of type 'int' [-Wint-conversion]
    drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: 'cleanup' function '__free_pages' must take 1 parameter
    drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
    drivers/clk/renesas/r9a09g077-cpg.c:966:51: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- csky-allmodconfig
|   |-- drivers-clk-renesas-r9a09g077-cpg.c:error:cleanup-argument-not-a-function
|   |-- drivers-clk-renesas-r9a09g077-cpg.c:error:implicit-declaration-of-function-kzalloc_obj
|   `-- drivers-clk-renesas-r9a09g077-cpg.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- hexagon-allmodconfig
|   |-- drivers-clk-renesas-r9a09g077-cpg.c:error:call-to-undeclared-function-kzalloc_obj-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-clk-renesas-r9a09g077-cpg.c:error:cleanup-function-__free_pages-must-take-parameter
|   |-- drivers-clk-renesas-r9a09g077-cpg.c:error:incompatible-integer-to-pointer-conversion-initializing-struct-regmap_config-with-an-expression-of-type-int
|   `-- drivers-clk-renesas-r9a09g077-cpg.c:error:use-of-undeclared-identifier-__free_kfree
|-- i386-allmodconfig
|   |-- drivers-clk-renesas-r9a09g077-cpg.c:error:cleanup-argument-not-a-function
|   |-- drivers-clk-renesas-r9a09g077-cpg.c:error:implicit-declaration-of-function-kzalloc_obj
|   `-- drivers-clk-renesas-r9a09g077-cpg.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- i386-allyesconfig
|   |-- drivers-clk-renesas-r9a09g077-cpg.c:error:cleanup-argument-not-a-function
|   |-- drivers-clk-renesas-r9a09g077-cpg.c:error:implicit-declaration-of-function-kzalloc_obj
|   `-- drivers-clk-renesas-r9a09g077-cpg.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
`-- um-allmodconfig
    |-- drivers-clk-renesas-r9a09g077-cpg.c:error:call-to-undeclared-function-kzalloc_obj-ISO-C99-and-later-do-not-support-implicit-function-declarations
    |-- drivers-clk-renesas-r9a09g077-cpg.c:error:cleanup-function-__free_pages-must-take-parameter
    |-- drivers-clk-renesas-r9a09g077-cpg.c:error:incompatible-integer-to-pointer-conversion-initializing-struct-regmap_config-with-an-expression-of-type-int
    `-- drivers-clk-renesas-r9a09g077-cpg.c:error:use-of-undeclared-identifier-__free_kfree

elapsed time: 1304m

configs tested: 55
configs skipped: 4

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
