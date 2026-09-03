Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7CF233D9E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 04:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408411; cv=none; b=FAgE/uUDjU1VpxG5KoJg6VPhY085CJSGKMmMo/Fxz80Q8QK5CesOwH5gGo8jNw61YXn2aJUYQeMGZIPNW7CYv+e+vLSH5fXvfxhy41/9PlRj81CZ5T1E0BW3/19waybhdwV1E+L//xGFsjPvCdKhimW8pFmu/ozvEBQ8XgDjX7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408411; c=relaxed/simple;
	bh=az8xXKannc5SFT9eOh9U4GeGbMwww5UHuP5SYTecWJg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NSyN8aRLL5Tp5kOC+PY9mk+73Yj0irHfKuSLE+9oGUMdUkBUcA1BCC0taiA34VrZ+ghpB7Y9wZ6cLRGMFol0lw/D5c1M8xvaif49biit3v32ZhXFrbCwGHf14mj0dw+pqiXWANd9J0rOwtQuJESGz/9L+eeSBa2UyQgpe31hPkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awm/w/OE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awm/w/OE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788408409; x=1819944409;
  h=date:from:to:cc:subject:message-id;
  bh=az8xXKannc5SFT9eOh9U4GeGbMwww5UHuP5SYTecWJg=;
  b=awm/w/OEq+UZ8H8D/tgt7OdSNy+pLs/aCjnHD+9bG59rAsPzz6eD8gV3
   ZUtjypGt1f/QoRR967l+t2FcJf590uv211UNh5FnAsta7XSN9qITGgV+A
   F7XDAmELwn5xVdgW84I/cMNDjkBHeTiXFF86kqHucZPXkYvCbrdH/TCaj
   WkufBsNvDHPdw4nTz66Gztr+i1xjmXahyNRi+zvUFebWXdVlcxj3E5byd
   C+BC7Un01Ll4NF9Z30faRuX+8UxsvQ2rKkFNnuYVS740B/vVHYdjGkzZ8
   UjV6/JOYq77uOPUOMd5bdMZK2rFtDoqt1N9DL9/wt8e3j7Erj9fxwmkZY
   g==;
X-CSE-ConnectionGUID: 7osY7rBvTlKnhcSrLayIpg==
X-CSE-MsgGUID: /55obWHfT1S4ST1n4PYtKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="111651579"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="111651579"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 21:06:49 -0700
X-CSE-ConnectionGUID: 6AH1BPloRVeuLqAeNiTcpg==
X-CSE-MsgGUID: HIlXVP1VR8y4xhjFd0DHqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="273355628"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Sep 2026 21:06:47 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1yiq-000000003zR-3kTX;
	Thu, 03 Sep 2026 04:06:44 +0000
Date: Thu, 03 Sep 2026 12:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 d48a308fabd6dc7676d570f0bc971817e39d824c
Message-ID: <202609031222.VTHL9XuN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: d48a308fabd6dc7676d570f0bc971817e39d824c  pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L

elapsed time: 3919m

configs tested: 121
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                    allnoconfig    gcc-16.1.0
alpha                   allyesconfig    gcc-16.1.0
alpha       randconfig-r054-20260902    clang-22
arc                     allmodconfig    clang-24
arc                     allmodconfig    gcc-16.1.0
arc                      allnoconfig    gcc-16.1.0
arc                     allyesconfig    clang-24
arc                     allyesconfig    gcc-16.1.0
arc         randconfig-r122-20260901    clang-24
arm                      allnoconfig    clang-17
arm                      allnoconfig    gcc-16.1.0
arm                     allyesconfig    clang-24
arm                     allyesconfig    gcc-16.1.0
arm         randconfig-r052-20260902    clang-22
arm         randconfig-r112-20260901    clang-24
arm64                   allmodconfig    clang-24
arm64                    allnoconfig    gcc-16.1.0
arm64       randconfig-r053-20260902    clang-24
csky                    allmodconfig    gcc-16.1.0
csky                     allnoconfig    gcc-16.1.0
csky        randconfig-r061-20260902    clang-22
csky        randconfig-r062-20260902    clang-22
csky        randconfig-r072-20260902    gcc-14.3.0
hexagon                 allmodconfig    gcc-16.1.0
hexagon                  allnoconfig    clang-24
hexagon                  allnoconfig    gcc-16.1.0
hexagon      randconfig-001-20260901    clang-24
hexagon      randconfig-002-20260901    clang-24
hexagon     randconfig-r071-20260902    clang-24
i386                    allmodconfig    clang-22
i386                     allnoconfig    gcc-14
i386                     allnoconfig    gcc-16.1.0
i386                    allyesconfig    clang-22
i386         randconfig-051-20260902    clang-22
i386         randconfig-052-20260902    clang-22
i386         randconfig-053-20260902    clang-22
i386         randconfig-054-20260902    clang-22
i386         randconfig-141-20260901    gcc-14
i386         randconfig-141-20260902    clang-22
i386        randconfig-r063-20260902    clang-22
loongarch               allmodconfig    clang-24
loongarch                allnoconfig    clang-20
loongarch                allnoconfig    gcc-16.1.0
loongarch    randconfig-001-20260901    clang-18
loongarch    randconfig-002-20260901    gcc-15.2.0
m68k                    allmodconfig    gcc-16.1.0
m68k                     allnoconfig    gcc-16.1.0
m68k                    allyesconfig    clang-24
m68k                    allyesconfig    gcc-16.1.0
microblaze               allnoconfig    gcc-16.1.0
microblaze              allyesconfig    gcc-16.1.0
microblaze  randconfig-r113-20260901    clang-24
mips                    allmodconfig    gcc-16.1.0
mips                     allnoconfig    gcc-16.1.0
mips                    allyesconfig    gcc-16.1.0
mips        randconfig-r134-20260902    gcc-13.4.0
nios2                   allmodconfig    clang-20
nios2                    allnoconfig    clang-24
nios2                    allnoconfig    gcc-11.5.0
nios2        randconfig-001-20260901    gcc-8.5.0
nios2        randconfig-002-20260901    gcc-8.5.0
nios2       randconfig-r072-20260902    gcc-8.5.0
nios2       randconfig-r111-20260901    clang-24
nios2       randconfig-r123-20260901    clang-24
openrisc                allmodconfig    clang-20
openrisc                 allnoconfig    clang-24
openrisc                 allnoconfig    gcc-16.1.0
openrisc    randconfig-r053-20260902    clang-22
openrisc    randconfig-r064-20260902    clang-22
openrisc    randconfig-r071-20260902    gcc-16.1.0
parisc                  allmodconfig    gcc-16.1.0
parisc                   allnoconfig    clang-24
parisc                   allnoconfig    gcc-16.1.0
parisc                  allyesconfig    clang-17
parisc                  allyesconfig    gcc-16.1.0
parisc      randconfig-r054-20260902    clang-24
powerpc                 allmodconfig    gcc-16.1.0
powerpc                  allnoconfig    clang-24
powerpc                  allnoconfig    gcc-16.1.0
powerpc     randconfig-r132-20260902    gcc-13.4.0
powerpc     randconfig-r133-20260902    gcc-13.4.0
riscv                   allmodconfig    clang-24
riscv                    allnoconfig    clang-24
riscv                    allnoconfig    gcc-16.1.0
riscv                   allyesconfig    clang-24
riscv       randconfig-r051-20260902    clang-22
s390                    allmodconfig    clang-17
s390                    allmodconfig    clang-24
s390                     allnoconfig    clang-24
s390                    allyesconfig    gcc-16.1.0
sh                      allmodconfig    gcc-16.1.0
sh                       allnoconfig    clang-24
sh                       allnoconfig    gcc-16.1.0
sh                      allyesconfig    clang-17
sh                      allyesconfig    gcc-16.1.0
sh          randconfig-r121-20260901    clang-24
sparc                    allnoconfig    clang-24
sparc                    allnoconfig    gcc-16.1.0
sparc       randconfig-r052-20260902    clang-24
sparc64                 allmodconfig    clang-20
sparc64     randconfig-r051-20260902    clang-24
sparc64     randconfig-r131-20260902    gcc-13.4.0
um                      allmodconfig    clang-17
um                       allnoconfig    clang-17
um                       allnoconfig    clang-24
um                      allyesconfig    gcc-14
um                      allyesconfig    gcc-16.1.0
x86_64                  allmodconfig    clang-22
x86_64                   allnoconfig    clang-22
x86_64                   allnoconfig    clang-24
x86_64                  allyesconfig    clang-22
x86_64       randconfig-011-20260901    gcc-14
x86_64       randconfig-012-20260901    gcc-14
x86_64       randconfig-013-20260901    gcc-14
x86_64       randconfig-014-20260901    gcc-14
x86_64       randconfig-015-20260901    gcc-12
x86_64       randconfig-016-20260901    gcc-14
x86_64                 rhel-9.4-rust    clang-22
xtensa                   allnoconfig    clang-24
xtensa                   allnoconfig    gcc-16.1.0
xtensa                  allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
