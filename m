Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F621A23A6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 02:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778638654; cv=none; b=C1mMFyeF4dx94Gd817gFRUsRCLAxI376S5edpDkYDbtCwRC3D7vi7X2wVY0mlALZPCAhyQd2c4gnDQRTt0krND1L3JuwJqSDsGBX4P6d5qob9iLx79bcNip4gWFITXJscAHniFKZ+HLtTcVpvZTLGNHuGx8C7v/DUHlalF5WHA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778638654; c=relaxed/simple;
	bh=BfPCvzKYNuIbNbyCY8F/eigUgWSjnye4GhakZmVrY2o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ek2oZMgFK+pU/ZkmZ0zNfcMwtqZiXSfRfzQeJv43qWMm9JHiLyU49/JaiQtUCwJoYB4D4NUlOmvh31QHWJZu5eyGVsQO3X8o7NvuaSwXpsLTYP0Nj/aBMJyX2EaMmg8ZQJsLq78WCkPnd2UbjagQ3UkXjO+5zNTskMiPHgyCBE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nq2saor4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nq2saor4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778638654; x=1810174654;
  h=date:from:to:cc:subject:message-id;
  bh=BfPCvzKYNuIbNbyCY8F/eigUgWSjnye4GhakZmVrY2o=;
  b=nq2saor4N0Oiqz2lXP/NrJtFHZTKLVxSpaNeIwWNyKnQE3EqSI76+J93
   U12viei8vP9ukI52FS9okXHDYTrIWdPsHbu8eqOGqrRXOYLQUaf8zkYFd
   WMpcGxEJ2H0B5P9A2VE8+igMwjR3Q7crsYRasFa3hClR/wXuOc8GV8mid
   jGs2vWzxUrE6gxbC8TM7V4UnL9UDL3j0LtyEf6QyekWp1Rn2GXz/SScT+
   oC+pE1yN3m/BFQOhlzebNgElJ5QKE3P7QiCiONUQpCmK7b5TrBRdDWgve
   70HcZcMHbQmuUBwOetImWVQSsmpgQB+daX3zd2osFImC7fUrqNIgaRjuf
   Q==;
X-CSE-ConnectionGUID: iWloxTZ/TzimaqnPufcrcw==
X-CSE-MsgGUID: W7mwITzRR6WDJ5mSGsMn9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78702357"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="78702357"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 19:17:33 -0700
X-CSE-ConnectionGUID: xKwibxkDSN6Ms46YbJ5WaQ==
X-CSE-MsgGUID: H9l2NZrJTLOA93XUqWm3mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="261435584"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2026 19:17:32 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMzA9-000000003Bz-2y4n;
	Wed, 13 May 2026 02:17:29 +0000
Date: Wed, 13 May 2026 10:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 85ddeaff5849598ab183db29d8b60474b634eae9
Message-ID: <202605131014.12uJm4tG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 85ddeaff5849598ab183db29d8b60474b634eae9  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 724m

configs tested: 55
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0
xtensa       allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
