Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B5A4BFE81
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2026 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041454; cv=none; b=ny7K0w8fYAm6P5MTQfGuLAEz3QOFBtMtLOHl1HgemdGcbn+TqaFacYjk1DxtV3QDsNowqtp5vBlukzgH1lFhDslaHNQRrZd7rcFKL3cHPHBYAnj7suZ7v/5KeRZavOBNmjBmDXouiPoohcI6mmvSa304zTfTSK17Oj/r7+E6Czw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041454; c=relaxed/simple;
	bh=fewCrdVpn3FfzN0hop0b7RYy9XMjhiN6Jvmuc7wgu6I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P8n/5FIdiL0g/PakqhIihQnbpYCYHwoVfDzpX0gtfVjql8u4fjQ5k52ZSKWRGevgqEYXy9ItLrho/djlKC+1fdvHaWYnzF1jK/OYxbCz2O1mwehzRccche8qUmtFr1G2UW8ivOmxT4ucub73iigsfP5ZiW3gyA7HvD6adMXVgMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TUsGa4g+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUsGa4g+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789041454; x=1820577454;
  h=date:from:to:cc:subject:message-id;
  bh=fewCrdVpn3FfzN0hop0b7RYy9XMjhiN6Jvmuc7wgu6I=;
  b=TUsGa4g+lbs/RKJnyJEhyYQCSFheGfsyvreD/37MVvCRXR6+A1CsuI0z
   Y2QC+qT0bFmYCPZpzaiHm28b1iFWVOIZyKHNqczv80JhjkY08R+FUiIJk
   DmCfjaW1K/FGHuhV06EO3LSCTlfZRATMf1h/yEeNIz8ZGYJ1IRc98i3RB
   MUA8COdsBLgweFgestRBrseV2JbNuDsm/K6jy+0KqzluekhHNzDPYos78
   UnN0dyg89Dnx8uBnWMg5VJyYiQvYvafo99Cf4ap+dgSYgLeTVrUpU0Usd
   N60+R+ZZGX8I+fjBqxSfoGY2Kr5ODLxckpBAvCkwq0ulMPu9OXEmaAbXm
   Q==;
X-CSE-ConnectionGUID: zFP/Sqg7QICmZnklthf4qg==
X-CSE-MsgGUID: nPWGIoBASsKKXRI/LtbT0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93314513"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93314513"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:57:33 -0700
X-CSE-ConnectionGUID: 6NxefYFoTwiHsgCPtPbgIw==
X-CSE-MsgGUID: AuIqcXgnTVu/kVE7QXyDyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="268337226"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Sep 2026 04:57:32 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4dPF-000000001lx-2iJT;
	Thu, 10 Sep 2026 11:57:29 +0000
Date: Thu, 10 Sep 2026 19:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 3f3fe195e7d908dc15ad7ab99f38e9225225b538
Message-ID: <202609101935.FGTgbstC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: 3f3fe195e7d908dc15ad7ab99f38e9225225b538  pinctrl: renesas: rzt2h: Remove unused struct rzt2h_pinctrl::gpio_range

elapsed time: 1304m

configs tested: 55
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

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
