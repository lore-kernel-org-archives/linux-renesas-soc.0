Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC8747ACF5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2026 11:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041515; cv=none; b=PzfMjmldvxYCnpLcIIw+WgL//e1haW3WHjtf/wDANWCy8y+ZZ+SuGfY6Alr1eHVpM/mvvVPRq1U7/w78SC+mu0XX7eFDS3L3C7H372Xn9L4BzAa7Y+GJlIwLnV3ljjCcfIyE8LJK2kaht0ecklYy7uGR1hzEDeCVPrJ+Sh82MZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041515; c=relaxed/simple;
	bh=cC0X4CEwk9dY9GhwYOLOiLG5wplUgci22Dnq2IW+OU4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LxFkKdmMmlhFTl9+25867yMwDNIEl2UPddMy1tArW8Ay0ZeS93Z8qapGBFJGhc6G4f3zfJ7OvypJxBon3bOZUbD2NZjUU0LB5VVAceGIT/xyQ3Be+dii8mQQXJeM7jnp7g/Mn5GERDU84qUxR5acELoF8N6FHwAHbazeazPUV7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZUBpPv2; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZUBpPv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789041513; x=1820577513;
  h=date:from:to:cc:subject:message-id;
  bh=cC0X4CEwk9dY9GhwYOLOiLG5wplUgci22Dnq2IW+OU4=;
  b=lZUBpPv2lmEmjoHNfB+COmYLGyPnIUURLhlEAYzQzofitdSImqIlOM1n
   3SEgQ0ovaxIYjiJcVAwF9HEJdkQq9uvymPu5ew/Ema/nK46fkrdmVwj6y
   7Juy4AQncDMTwqygbc+E8FsK2GoyneRBSIThzziT3S2ZcTNJ8QqMlFZLs
   X+AQDK8KGgVcxkrQo21vxhUS53yiVsgYYRUvKBnEG2JFMP9rDiHCVw8Da
   Q0/1AwojPNvxMpO26WiwCZTMEOBCZgWlwsJDalf6q1ER7Nfshk5FYt2GS
   +mjuSAYfoL7woWMNvEOnv0rwVYXJM+8AwpRWhN5KQ8WN2TRfSGbZ743UT
   w==;
X-CSE-ConnectionGUID: YW5zgwpwTeKea6ixUiLE2g==
X-CSE-MsgGUID: aJbNDUkhTKWLi0s81Voxng==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="10602"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="10602"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:58:33 -0700
X-CSE-ConnectionGUID: HpHZeCjsTo2cJo1FSbUAEQ==
X-CSE-MsgGUID: 6+9opJnGR4yTyYi3NaBrqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="269039628"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2026 04:58:32 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4dQD-000000001m7-45qf;
	Thu, 10 Sep 2026 11:58:29 +0000
Date: Thu, 10 Sep 2026 19:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic:renesas-defconfig] BUILD SUCCESS
 0d9298d57e563e79173c6a69fec4afea4d21713e
Message-ID: <202609101905.Vi0UbJTz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 0d9298d57e563e79173c6a69fec4afea4d21713e  arm64: renesas: defconfig: Increase NR_CPUS to 32

elapsed time: 1306m

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
