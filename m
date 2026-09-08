Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D6F43551D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855931; cv=none; b=AQTkc4MT3em9wPHyUEPmiRmbpPs6NKH1DFKrsG829lM5a8Zlc9ppucefSxael1Dvjl7Cg4UYqJrJrSPQBEySbgKGp7CXHyHlRF3NZUp1vbdvF7XNA5WnRs6bI44CKozrUQNE9jeQ7SH1dgk0ogdexRnHY6ggWAGwBhRG0xENnE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855931; c=relaxed/simple;
	bh=RyWC9ZH0A+cO9YbBtFxaL8alX2jIQiPPGivCwS/dm+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mP5mTRGgy+pkHqUoBoSQ1HprtU5xDPsVXTyieGPyqkogpxrlY8aMYdydmnlbbkydPwhyfUIIUbBZh9HDhRK0kQ0jr2bXgd0+eJAW5vc6jXFLcUsv6aX+upsFMTakWq4UI2wUK8SrdMOP5Yy4M0TOZi2v1VR71ibobQrWZhm1Nkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZ5GdQFN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZ5GdQFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788855930; x=1820391930;
  h=date:from:to:cc:subject:message-id;
  bh=RyWC9ZH0A+cO9YbBtFxaL8alX2jIQiPPGivCwS/dm+M=;
  b=RZ5GdQFNjpMUuuDB2XyveDt862iyDjQLh6OR02vYQ3eZ57HZK/GoyXKr
   KiDspkEDkfu/h5wVQ4djuMsJrDsgNB8C869zWNg4bn4aNQ86yCTQnx+yJ
   YGVQBRdbUmKg+8hiyHb+2n6ljQ3XpIwCs7ecp/dWMbbI/rLltJxdv4IMo
   FjJFSKcKz/ZWIEQTtZAx9+IK1PsmY/TEVNjgtrGOxHb9tGSNXSUgSBUtS
   yt/GKwAQ4VuTrhcj1lXuDN7sVvNYte0YmjPkF5v5UaEP01DoA2aXo5x1I
   XTYYXzQ6en8uybMBVjS8S1XaAOwl+l89Gzup2dziAbiaB6cViJbEtrfhc
   g==;
X-CSE-ConnectionGUID: ZyUaHEOZQOadR5oPlcLVdQ==
X-CSE-MsgGUID: AsMk9fa5QNK3ph+BKjvDHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89294275"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89294275"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:25:29 -0700
X-CSE-ConnectionGUID: I76Z8J/7ST6aGteTRrm/RA==
X-CSE-MsgGUID: 9Zv0vPXFTM+d8nxLtQH4xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="276188486"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Sep 2026 01:25:27 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3r8v-000000001tP-1R1V;
	Tue, 08 Sep 2026 08:25:25 +0000
Date: Tue, 08 Sep 2026 16:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 ec5202ccfa24791acf64146d5bac6b63ce234f95
Message-ID: <202609081603.9eTea8nS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: ec5202ccfa24791acf64146d5bac6b63ce234f95  pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting I3C power source

elapsed time: 1329m

configs tested: 78
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
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
