Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A9447CC8A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2026 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041517; cv=none; b=qyTkurvBhbO46+hCOee96i3rXmm/ft+BIX8M65IPrblSuzWQXeeJinNOmRCWJBQfr3UntFX/4fl0W58i+eo++IFWAZEaMvfpJLd3QcUDF2O1ruzgS7+9AMfp7XIJSytN6VcZJj9jQjR6Szc/ncaGv124W7DTOFOCQVCaEYJMRxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041517; c=relaxed/simple;
	bh=zK6PmxwVTfF0SdLwbstSd41fqF13cMBGlp5bErkrisQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OrizayVSNNjLm8lvN2pfjEKOpmQCb1wE2UO3wf+cSGkcpKgkc2WYkkoJVWYGRA2cLiQj6iXQoCkI7wnBM87m+pcCbB84JbSlodzX0wnSAQS1QIjzwN8QIOpIE3gfrBq5LhrC7qR0IdxoCafeCQE/L/i2JC6Xg0mZxf8uLby3Lok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ex6n2Jg+; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ex6n2Jg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789041515; x=1820577515;
  h=date:from:to:cc:subject:message-id;
  bh=zK6PmxwVTfF0SdLwbstSd41fqF13cMBGlp5bErkrisQ=;
  b=ex6n2Jg+2vki9GsPpkF3JMk6SWzaiEK6ZmkfGawyU62fxCHLsUw4mP2F
   2yENLBxfXqIb2ep6NZ5BmoKTXB0gbR9xoWAmhvFP1yiB4Lf0yVupI+bSW
   ee1CFuKPpVaSPhzhg3QARsl236SKQMPLd+2I4YXxBqmGhEj04Q7mpv47q
   TpR/fec/2mqveJQcscpOvycqNRk3Wd6eafDMLVvLz6stsDEoLjYvOnciC
   irIyQsjGHQ5Ijj/pAQnGYcJRgqqfw84fXF89aqnOy2PifErA8nvzRz1OW
   qe0B1Vs9yebWMbm/XZlm0U6onBs1DKHfDxJzechbiNhHvewLSUJUsp6g8
   Q==;
X-CSE-ConnectionGUID: GiBbeTH5SmqRDhOoOB0VXw==
X-CSE-MsgGUID: SkLRypIdTomP6PNRceWBqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="10604"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="10604"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:58:33 -0700
X-CSE-ConnectionGUID: jlknJmG8Qy2it+0rstOb3g==
X-CSE-MsgGUID: lU3r62bLRiueSu/Xy1SyfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="269039630"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2026 04:58:32 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4dQD-000000001m3-3LWP;
	Thu, 10 Sep 2026 11:58:29 +0000
Date: Thu, 10 Sep 2026 19:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 8dda3e6dc64e2f676d5d324c9ab6fe18e766cbe0
Message-ID: <202609101925.dKdtCE1T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 8dda3e6dc64e2f676d5d324c9ab6fe18e766cbe0  Merge branches 'renesas-arm-defconfig-for-v7.4' and 'renesas-dts-for-v7.4' into renesas-next

elapsed time: 1305m

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
