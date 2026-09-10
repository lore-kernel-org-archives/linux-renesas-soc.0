Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A601A6838
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2026 03:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789012343; cv=none; b=geunA2pTgdHmfpH9YgmFFUoXMiDxcw8utAZggx4qIPxNX+Dot2giH+xRUnJ12txy0VAAxXK/aCypBxxFc80hupffEdJWyVAlcar8cb6PQzmmIooUdEAOgzLk3J0+kHp6jFOtHMySulzaach0QtxjUv6JUSTOwFsHzIc+q0L+eFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789012343; c=relaxed/simple;
	bh=I2Wl6tsYCJs7HhQX3gLFESUMEAERK51s9k3OFqrFUnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ATXhtvzF73Edm4O9MNLt134DgYcW7oUvEnmdswyA6ak19AexMmj2itqIdzuRQ1CcjGe4ZdvaqexN0Rs420iBG4v15+70MMRn22h2hJa9druiUPbEhV33h28Op8Qimogw3neS8RTZMPrkbIIL0iKQxLi6zY+3r44niGDb4FBbzWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhTtHvhF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhTtHvhF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789012341; x=1820548341;
  h=date:from:to:cc:subject:message-id;
  bh=I2Wl6tsYCJs7HhQX3gLFESUMEAERK51s9k3OFqrFUnQ=;
  b=YhTtHvhFsUgsAUGnxapDnfDq5nfbEztKm0LTQoBedR0yQUEE5wWwioiD
   janY/Kj1i4bl0mq308w8a0Hdh2rwT0tncakbW7IWxDarrRQexaMe5Lrux
   f+XFcf/U2CcZyIqGq7kmkObd/OFzL2Xg+i2mUCGY6Q0HGD3UvW8/QNibx
   74toHxF9y2bBvdSh/pOrr/U++5LKfz9gzUqxDLg4hgoG0IgeNCiXQ21+m
   J+VMtagmkLN7VGaavje+LIjZKIzeymuHLMs/7rydKJqgEyDZeqaDZNFJG
   9R99O1ysB0LXOS0XsJn86PK05w+FDVyDq4wUmCb3yMsbmuUm2goBs489B
   g==;
X-CSE-ConnectionGUID: MWRRjqjQQKGGekJSIPD50A==
X-CSE-MsgGUID: cMJczSMzTxOv2W3KgPqJ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88599367"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="88599367"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 20:52:21 -0700
X-CSE-ConnectionGUID: tpRaoPdpTwq1MkIoVvqSCg==
X-CSE-MsgGUID: eN+dcCJ+RheJnRQfRcXE4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="271485735"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2026 20:52:20 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4Vpi-000000001Lg-0NTs;
	Thu, 10 Sep 2026 03:52:18 +0000
Date: Thu, 10 Sep 2026 11:51:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v7.4] BUILD
 SUCCESS 74463c1be2ad066b436209d01dcdf8e717896504
Message-ID: <202609101116.p5wTWS2C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v7.4
branch HEAD: 74463c1be2ad066b436209d01dcdf8e717896504  ARM: shmobile: defconfig: Refresh for v7.3-rc1

elapsed time: 819m

configs tested: 43
configs skipped: 40

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch     allnoconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc        allnoconfig    clang-24
parisc       allyesconfig    clang-17
powerpc       allnoconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
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
