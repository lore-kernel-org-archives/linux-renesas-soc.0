Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022811;
	b=ZMzjxFUYqjuwFEC+Szwo6JRKXZasFX0ZIXKG7BwcNa2fOE9T6Lb3QJinLVJrJT1DNwWZ
	 6OdZDcKLC4dGd0LvciEDZr2Hgw4IuprJAEu4bOro1s3KGxQgGjm9PIucgRogFr6/GDfTs
	 T+m6wN58yBQ+v1n4tZ2eUXEDw90VqPZIqu+7/RvC/pFk7SBDsntDaOe3yASG/6X2FTC5t
	 boVN5B99fSfbVVC57cL7GQopYICQCLBazbZgI7oRBesxadXvj6icjRFw6VCcwy4tfwqUR
	 QrGpQPeGOoyBHEEjtJxwxAgnkxqCPYsRile737O6+OqZMRxF0S9wnY36G/lqnjGPzCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022811;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=oaaMYgYgPyPwgm59kLODmNJ7Cjr12qnC+zajaDLBAWs=;
	b=OXF9oSUELj5XI2zKF032qm547HGeDIt3UbVQ+UtJoefO/koylP4rzKWF3iD2W+TGQiFn
	 DBcBqA5eRsbCDfR//fvbP2cE4m9Kfx5Tc1xPd1rRx5XdDylCDcw+DixxuD4xkKHOhXfnD
	 KxGvFiZ40Y0HipijEmRDDacWjMtw7Z+GjlRjAtshhftnwJerhjn3bl28AZrT5t4caVR0z
	 5nzWIHAPPSFHz5qHx2izmJY5oH3OQw0FjV5JqKxB45beWzh/JtvyBXQOUNKjkILb8znx+
	 ymLkZEPebFZk6xMM39vV1A3J75Fup6H4Q2+ReeJO+N3npzwGLPtk0m9lcdSziwVjIGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A2gAl2vb;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D8F606A742
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 17:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D8F606A742
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A2gAl2vb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795022811; x=1826558811;
  h=date:from:to:cc:subject:message-id;
  bh=bwdxyMIjXS6jUMy9VyhXtS/XrsWhGWeyiBWAOjDic5o=;
  b=A2gAl2vbhlGwgsezW2wp15mm8LS9y5GVmCf01Vc2yWDCdpalBj5zaY8Z
   /7FpNMnzl1DvVD8rSZddrgEyDIofTWKFUaF6usC6wyeS0SXzkKoPWgXtw
   VlaX6/DOL2b9CRQkHKjk5EqOuC7dBhqSVLWgg68Q6q3/Zh0Rof6kSWXOf
   XyfYK/kUq2amzNhGvjYNC9Yg/fkfrFB7ReNjxhDOWI0AbWiUiecLGhdwY
   0yiucrEorz6EkSHfiB8d/YIk2Xx34PuejMew3UDxqHU73ezOyAmwCI/5h
   RsDjdRSt4F4IGUdpoPjBcxsPaFIa1OXfspWzoeTxRxC1wmHFm6qsMMdHG
   g==;
X-CSE-ConnectionGUID: QfAECEL8QXmHn5NGRKnafQ==
X-CSE-MsgGUID: kpITMPwpQ2WXVbkAI7VB3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3837671"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3837671"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 09:26:50 -0800
X-CSE-ConnectionGUID: rd1WjJAgTdish65iZVYm+Q==
X-CSE-MsgGUID: 9Yvxn+K9SnO+XzO52tQ6aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10127446"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Nov 2026 09:26:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTjQj-00000001E1Y-44fD;
	Wed, 18 Nov 2026 17:26:45 +0000
Date: Thu, 19 Nov 2026 01:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 7187ab7bd5b349cb1e25b03cbb3f0da7daffbb34
Message-ID: <20261119012604.9tYd7BMq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 7187ab7bd5b349cb1e25b03cbb3f0da7daffbb34  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 1489m

configs tested: 473
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261117    gcc-15.3.0
alpha                 randconfig-2000-20261118    gcc-16.2.0
alpha                 randconfig-2001-20261117    gcc-15.3.0
alpha                 randconfig-2001-20261118    gcc-16.2.0
alpha                 randconfig-2200-20261117    gcc-8.5.0  smatch
alpha                 randconfig-2200-20261118    gcc-13.5.0 smatch
alpha                randconfig-r2103-20261117    gcc-8.5.0  cocci
alpha                randconfig-r2301-20261117    gcc-14.4.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261118    gcc-10.5.0
arc                   randconfig-1001-20261118    gcc-10.5.0
arc                   randconfig-2000-20261117    gcc-12.5.0
arc                   randconfig-2000-20261118    gcc-11.5.0
arc                   randconfig-2001-20261117    gcc-12.5.0
arc                   randconfig-2001-20261118    gcc-11.5.0
arc                   randconfig-2002-20261117    gcc-12.5.0
arc                   randconfig-2002-20261118    gcc-11.5.0
arc                   randconfig-2003-20261117    gcc-12.5.0
arc                   randconfig-2003-20261118    gcc-11.5.0
arc                   randconfig-2004-20261117    gcc-12.5.0
arc                   randconfig-2004-20261118    gcc-11.5.0
arc                   randconfig-2005-20261117    gcc-12.5.0
arc                   randconfig-2005-20261118    gcc-11.5.0
arc                   randconfig-2200-20261117    gcc-8.5.0  smatch
arc                  randconfig-r2101-20261117    gcc-8.5.0  cocci
arc                  randconfig-r2302-20261117    gcc-16.2.0 sparse
arc                  randconfig-r2302-20261118    gcc-8.5.0  sparse
arc                  randconfig-r2303-20261117    gcc-16.2.0 sparse
arc                  randconfig-r2305-20261118    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261118    gcc-10.5.0
arm                   randconfig-1001-20261118    gcc-10.5.0
arm                   randconfig-1002-20261118    gcc-10.5.0
arm                   randconfig-1003-20261118    gcc-10.5.0
arm                   randconfig-2000-20261117    gcc-10.5.0
arm                   randconfig-2000-20261118    gcc-13.5.0
arm                   randconfig-2001-20261117    gcc-10.5.0
arm                   randconfig-2001-20261118    gcc-13.5.0
arm                   randconfig-2002-20261117    gcc-10.5.0
arm                   randconfig-2002-20261118    gcc-13.5.0
arm                   randconfig-2200-20261118    gcc-8.5.0  smatch
arm                  randconfig-r2107-20261118    gcc-14     cocci
arm                  randconfig-r2311-20261117    clang-18   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261118    gcc-16.2.0
arm64                 randconfig-1001-20261118    gcc-16.2.0
arm64                 randconfig-1002-20261118    gcc-16.2.0
arm64                 randconfig-1003-20261118    gcc-16.2.0
arm64                 randconfig-2000-20261117    gcc-10.5.0
arm64                 randconfig-2000-20261118    gcc-13.5.0
arm64                 randconfig-2001-20261117    gcc-10.5.0
arm64                 randconfig-2001-20261118    gcc-13.5.0
arm64                 randconfig-2002-20261117    gcc-10.5.0
arm64                 randconfig-2002-20261118    gcc-13.5.0
arm64                 randconfig-2200-20261117    clang-17   smatch
arm64                 randconfig-2200-20261118    clang-24   smatch
arm64                randconfig-r2111-20261117    gcc-14     cocci
arm64                randconfig-r2306-20261117    clang-18   sparse
arm64                randconfig-r2309-20261117    clang-18   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261118    gcc-16.2.0
csky                  randconfig-1001-20261118    gcc-16.2.0
csky                  randconfig-2000-20261117    gcc-16.2.0
csky                  randconfig-2000-20261118    gcc-16.2.0
csky                  randconfig-2001-20261117    gcc-16.2.0
csky                  randconfig-2001-20261118    gcc-16.2.0
csky                  randconfig-2200-20261117    gcc-14.4.0 smatch
csky                  randconfig-2200-20261118    gcc-16.2.0 smatch
csky                 randconfig-r2100-20261117    gcc-13.5.0 cocci
csky                 randconfig-r2104-20261117    gcc-8.5.0  cocci
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261118    clang-22
hexagon               randconfig-1001-20261118    clang-22
hexagon               randconfig-2000-20261117    gcc-16.2.0
hexagon               randconfig-2000-20261118    gcc-16.2.0
hexagon               randconfig-2001-20261117    gcc-16.2.0
hexagon               randconfig-2001-20261118    gcc-16.2.0
hexagon               randconfig-2200-20261117    clang-17   smatch
hexagon               randconfig-2200-20261118    clang-20   smatch
hexagon              randconfig-r2106-20261118    gcc-14     cocci
hexagon              randconfig-r2303-20261117    gcc-14.4.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261118    gcc-12
i386        buildonly-randconfig-1001-20261118    gcc-12
i386        buildonly-randconfig-1002-20261118    gcc-12
i386        buildonly-randconfig-1003-20261118    gcc-12
i386        buildonly-randconfig-1004-20261118    gcc-12
i386        buildonly-randconfig-1005-20261118    gcc-12
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261118    clang-22
i386                  randconfig-1001-20261118    clang-22
i386                  randconfig-1002-20261118    clang-22
i386                  randconfig-1003-20261118    clang-22
i386                  randconfig-1004-20261118    clang-22
i386                  randconfig-1005-20261118    clang-22
i386                  randconfig-1006-20261118    clang-22
i386                  randconfig-1007-20261118    clang-22
i386                  randconfig-1008-20261118    clang-22
i386                  randconfig-1009-20261118    clang-22
i386                  randconfig-1010-20261118    clang-22
i386                  randconfig-1011-20261118    clang-22
i386                  randconfig-1012-20261118    clang-22
i386                  randconfig-1013-20261118    clang-22
i386                  randconfig-2000-20261117    clang-22
i386                  randconfig-2000-20261118    gcc-14
i386                  randconfig-2001-20261117    clang-22
i386                  randconfig-2001-20261118    gcc-14
i386                  randconfig-2002-20261117    clang-22
i386                  randconfig-2002-20261118    gcc-14
i386                  randconfig-2003-20261117    clang-22
i386                  randconfig-2003-20261118    gcc-14
i386                  randconfig-2004-20261117    clang-22
i386                  randconfig-2004-20261118    gcc-14
i386                  randconfig-2005-20261117    clang-22
i386                  randconfig-2005-20261118    gcc-14
i386                  randconfig-2100-20261117    clang-22   cocci
i386                  randconfig-2100-20261118    gcc-14     cocci
i386                  randconfig-2101-20261117    clang-22   cocci
i386                  randconfig-2101-20261118    gcc-14     cocci
i386                  randconfig-2102-20261117    clang-22   cocci
i386                  randconfig-2102-20261118    gcc-14     cocci
i386                  randconfig-2103-20261117    clang-22   cocci
i386                  randconfig-2103-20261118    gcc-14     cocci
i386                  randconfig-2104-20261117    clang-22   cocci
i386                  randconfig-2104-20261118    gcc-14     cocci
i386                  randconfig-2105-20261117    clang-22   cocci
i386                  randconfig-2105-20261118    gcc-14     cocci
i386                  randconfig-2200-20261118    gcc-13     smatch
i386                  randconfig-2300-20261117    clang-22   sparse
i386                  randconfig-2300-20261118    gcc-14     sparse
i386                  randconfig-2301-20261117    clang-22   sparse
i386                  randconfig-2301-20261118    gcc-14     sparse
i386                  randconfig-2302-20261117    clang-22   sparse
i386                  randconfig-2302-20261118    gcc-14     sparse
i386                 randconfig-r2104-20261117    gcc-13.5.0 cocci
i386                 randconfig-r2110-20261117    gcc-13.5.0 cocci
i386                 randconfig-r2110-20261118    gcc-14     cocci
i386                 randconfig-r2300-20261117    gcc-16.2.0 sparse
i386                 randconfig-r2306-20261117    gcc-9.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch             randconfig-1000-20261118    clang-22
loongarch             randconfig-1001-20261118    clang-22
loongarch             randconfig-2000-20261117    gcc-8.5.0
loongarch             randconfig-2000-20261118    gcc-11.5.0
loongarch             randconfig-2001-20261117    gcc-8.5.0
loongarch             randconfig-2001-20261118    gcc-11.5.0
loongarch             randconfig-2200-20261117    gcc-13.5.0 smatch
loongarch             randconfig-2200-20261118    gcc-16.2.0 smatch
loongarch            randconfig-r2305-20261117    gcc-16.2.0 sparse
loongarch            randconfig-r2307-20261117    clang-18   sparse
loongarch            randconfig-r2311-20261118    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261117    gcc-15.3.0
m68k                  randconfig-2000-20261118    gcc-16.2.0
m68k                  randconfig-2001-20261117    gcc-15.3.0
m68k                  randconfig-2001-20261118    gcc-16.2.0
m68k                  randconfig-2200-20261117    gcc-11.5.0 smatch
m68k                  randconfig-2200-20261118    gcc-12.5.0 smatch
m68k                 randconfig-r2105-20261117    gcc-13.5.0 cocci
m68k                 randconfig-r2300-20261117    gcc-14.4.0 sparse
m68k                 randconfig-r2303-20261118    gcc-8.5.0  sparse
microblaze                        alldefconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze            randconfig-2000-20261117    gcc-15.3.0
microblaze            randconfig-2000-20261118    gcc-16.2.0
microblaze            randconfig-2001-20261117    gcc-15.3.0
microblaze            randconfig-2001-20261118    gcc-16.2.0
microblaze            randconfig-2200-20261117    gcc-14.4.0 smatch
microblaze            randconfig-2200-20261118    gcc-13.5.0 smatch
microblaze           randconfig-r2101-20261117    gcc-13.5.0 cocci
microblaze           randconfig-r2302-20261117    gcc-14.4.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261117    gcc-16.2.0
mips                  randconfig-2000-20261118    gcc-15.3.0
mips                  randconfig-2001-20261117    gcc-16.2.0
mips                  randconfig-2001-20261118    gcc-15.3.0
mips                  randconfig-2002-20261117    gcc-16.2.0
mips                  randconfig-2002-20261118    gcc-15.3.0
mips                  randconfig-2200-20261117    clang-24   smatch
mips                  randconfig-2200-20261118    clang-24   smatch
mips                 randconfig-r2107-20261117    gcc-13.5.0 cocci
mips                 randconfig-r2310-20261117    gcc-9.5.0  sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                 randconfig-1000-20261118    clang-22
nios2                 randconfig-1001-20261118    clang-22
nios2                 randconfig-2000-20261117    gcc-8.5.0
nios2                 randconfig-2000-20261118    gcc-11.5.0
nios2                 randconfig-2001-20261117    gcc-8.5.0
nios2                 randconfig-2001-20261118    gcc-11.5.0
nios2                 randconfig-2200-20261117    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261118    gcc-8.5.0  smatch
nios2                randconfig-r2102-20261117    gcc-8.5.0  cocci
nios2                randconfig-r2300-20261118    gcc-8.5.0  sparse
nios2                randconfig-r2307-20261117    gcc-9.5.0  sparse
nios2                randconfig-r2311-20261117    gcc-9.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                     or1ksim_defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261117    gcc-16.2.0
openrisc              randconfig-2000-20261118    gcc-15.3.0
openrisc              randconfig-2001-20261117    gcc-16.2.0
openrisc              randconfig-2001-20261118    gcc-15.3.0
openrisc              randconfig-2002-20261117    gcc-16.2.0
openrisc              randconfig-2002-20261118    gcc-15.3.0
openrisc              randconfig-2200-20261117    gcc-16.2.0 smatch
openrisc             randconfig-r2101-20261118    gcc-11.5.0 cocci
openrisc             randconfig-r2103-20261117    gcc-13.5.0 cocci
openrisc             randconfig-r2103-20261118    gcc-11.5.0 cocci
openrisc             randconfig-r2111-20261118    gcc-14     cocci
openrisc             randconfig-r2301-20261117    gcc-16.2.0 sparse
openrisc             randconfig-r2304-20261117    gcc-14.4.0 sparse
openrisc             randconfig-r2310-20261117    clang-18   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261118    gcc-8.5.0
parisc                randconfig-1001-20261118    gcc-8.5.0
parisc                randconfig-2000-20261117    gcc-8.5.0
parisc                randconfig-2000-20261118    gcc-11.5.0
parisc                randconfig-2001-20261117    gcc-8.5.0
parisc                randconfig-2001-20261118    gcc-11.5.0
parisc                randconfig-2200-20261117    gcc-8.5.0  smatch
parisc                randconfig-2200-20261118    gcc-11.5.0 smatch
parisc               randconfig-r2310-20261118    gcc-8.5.0  sparse
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc               randconfig-1000-20261118    gcc-8.5.0
powerpc               randconfig-1001-20261118    gcc-8.5.0
powerpc               randconfig-2000-20261117    gcc-8.5.0
powerpc               randconfig-2000-20261118    clang-21
powerpc               randconfig-2001-20261117    gcc-8.5.0
powerpc               randconfig-2001-20261118    clang-21
powerpc               randconfig-2002-20261117    gcc-8.5.0
powerpc               randconfig-2002-20261118    clang-21
powerpc               randconfig-2200-20261117    gcc-8.5.0  smatch
powerpc               randconfig-2200-20261118    clang-24   smatch
powerpc              randconfig-r2102-20261117    gcc-13.5.0 cocci
powerpc              randconfig-r2110-20261117    gcc-14     cocci
powerpc              randconfig-r2308-20261117    clang-18   sparse
powerpc              randconfig-r2308-20261117    gcc-9.5.0  sparse
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261118    gcc-8.5.0
powerpc64             randconfig-1001-20261118    gcc-8.5.0
powerpc64             randconfig-2000-20261117    gcc-8.5.0
powerpc64             randconfig-2000-20261118    clang-21
powerpc64             randconfig-2001-20261117    gcc-8.5.0
powerpc64             randconfig-2001-20261118    clang-21
powerpc64             randconfig-2002-20261117    gcc-8.5.0
powerpc64             randconfig-2002-20261118    clang-21
powerpc64             randconfig-2200-20261117    gcc-8.5.0  smatch
powerpc64             randconfig-2200-20261118    clang-24   smatch
powerpc64            randconfig-r2301-20261118    gcc-8.5.0  sparse
powerpc64            randconfig-r2306-20261118    gcc-8.5.0  sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261118    gcc-11.5.0
riscv                 randconfig-1001-20261118    gcc-11.5.0
riscv                 randconfig-2000-20261117    gcc-11.5.0
riscv                 randconfig-2000-20261118    gcc-8.5.0
riscv                 randconfig-2001-20261117    gcc-11.5.0
riscv                 randconfig-2001-20261118    gcc-8.5.0
riscv                 randconfig-2002-20261117    gcc-11.5.0
riscv                 randconfig-2002-20261118    gcc-8.5.0
riscv                 randconfig-2003-20261117    gcc-11.5.0
riscv                 randconfig-2003-20261118    gcc-8.5.0
riscv                 randconfig-2004-20261117    gcc-11.5.0
riscv                 randconfig-2004-20261118    gcc-8.5.0
riscv                 randconfig-2005-20261117    gcc-11.5.0
riscv                 randconfig-2005-20261118    gcc-8.5.0
riscv                 randconfig-2200-20261117    clang-24   smatch
riscv                 randconfig-2200-20261118    clang-24   smatch
riscv                randconfig-r2100-20261117    gcc-8.5.0  cocci
riscv                randconfig-r2108-20261117    gcc-14     cocci
riscv                randconfig-r2108-20261118    gcc-14     cocci
riscv                randconfig-r2304-20261118    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261118    gcc-11.5.0
s390                  randconfig-1001-20261118    gcc-11.5.0
s390                  randconfig-2000-20261117    gcc-15.3.0
s390                  randconfig-2000-20261118    clang-24
s390                  randconfig-2001-20261117    gcc-15.3.0
s390                  randconfig-2001-20261118    clang-24
s390                  randconfig-2002-20261117    gcc-15.3.0
s390                  randconfig-2002-20261118    clang-24
s390                  randconfig-2003-20261117    gcc-15.3.0
s390                  randconfig-2003-20261118    clang-24
s390                  randconfig-2004-20261117    gcc-15.3.0
s390                  randconfig-2004-20261118    clang-24
s390                  randconfig-2005-20261117    gcc-15.3.0
s390                  randconfig-2005-20261118    clang-24
s390                  randconfig-2200-20261117    gcc-11.5.0 smatch
s390                  randconfig-2200-20261118    gcc-8.5.0  smatch
s390                 randconfig-r2304-20261117    gcc-16.2.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7760_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261118    gcc-11.5.0
sh                    randconfig-1001-20261118    gcc-11.5.0
sh                    randconfig-2000-20261117    gcc-14.4.0
sh                    randconfig-2000-20261118    gcc-9.5.0
sh                    randconfig-2001-20261117    gcc-14.4.0
sh                    randconfig-2001-20261118    gcc-9.5.0
sh                    randconfig-2002-20261117    gcc-14.4.0
sh                    randconfig-2002-20261118    gcc-9.5.0
sh                    randconfig-2003-20261117    gcc-14.4.0
sh                    randconfig-2003-20261118    gcc-9.5.0
sh                    randconfig-2004-20261117    gcc-14.4.0
sh                    randconfig-2004-20261118    gcc-9.5.0
sh                    randconfig-2005-20261117    gcc-14.4.0
sh                    randconfig-2005-20261118    gcc-9.5.0
sh                    randconfig-2200-20261117    gcc-16.2.0 smatch
sh                    randconfig-2200-20261118    gcc-13.5.0 smatch
sh                   randconfig-r2102-20261118    gcc-11.5.0 cocci
sh                   randconfig-r2104-20261118    gcc-11.5.0 cocci
sh                   randconfig-r2109-20261117    gcc-14     cocci
sh                   randconfig-r2111-20261117    gcc-13.5.0 cocci
sh                             titan_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-2000-20261117    gcc-14
sparc                 randconfig-2000-20261118    clang-24
sparc                 randconfig-2001-20261117    gcc-14
sparc                 randconfig-2001-20261118    clang-24
sparc                 randconfig-2200-20261118    gcc-13.5.0 smatch
sparc                randconfig-r2100-20261118    gcc-11.5.0 cocci
sparc                randconfig-r2105-20261117    gcc-8.5.0  cocci
sparc                randconfig-r2307-20261118    gcc-8.5.0  sparse
sparc                randconfig-r2309-20261118    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-2000-20261117    gcc-14
sparc64               randconfig-2000-20261118    clang-24
sparc64               randconfig-2001-20261117    gcc-14
sparc64               randconfig-2001-20261118    clang-24
sparc64               randconfig-2200-20261117    gcc-8.5.0  smatch
sparc64               randconfig-2200-20261118    clang-22   smatch
sparc64              randconfig-r2108-20261117    gcc-13.5.0 cocci
sparc64              randconfig-r2305-20261117    gcc-14.4.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-2000-20261117    gcc-14
um                    randconfig-2000-20261118    clang-24
um                    randconfig-2001-20261117    gcc-14
um                    randconfig-2001-20261118    clang-24
um                    randconfig-2200-20261117    clang-21   smatch
um                    randconfig-2200-20261118    clang-24   smatch
um                   randconfig-r2105-20261118    gcc-11.5.0 cocci
um                   randconfig-r2107-20261117    gcc-14     cocci
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261118    gcc-14
x86_64      buildonly-randconfig-1001-20261118    gcc-14
x86_64      buildonly-randconfig-1002-20261118    gcc-14
x86_64      buildonly-randconfig-1003-20261118    gcc-14
x86_64      buildonly-randconfig-1004-20261118    gcc-14
x86_64      buildonly-randconfig-1005-20261118    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261118    gcc-14
x86_64                randconfig-1001-20261118    gcc-14
x86_64                randconfig-1002-20261118    gcc-14
x86_64                randconfig-1003-20261118    gcc-14
x86_64                randconfig-1004-20261118    gcc-14
x86_64                randconfig-1005-20261118    gcc-14
x86_64                randconfig-1006-20261118    gcc-14
x86_64                randconfig-1007-20261118    gcc-14
x86_64                randconfig-1008-20261118    gcc-14
x86_64                randconfig-1009-20261118    gcc-14
x86_64                randconfig-1010-20261118    gcc-14
x86_64                randconfig-1011-20261118    gcc-14
x86_64                randconfig-1012-20261118    gcc-14
x86_64                randconfig-1013-20261118    gcc-14
x86_64                randconfig-1014-20261118    gcc-14
x86_64                randconfig-1015-20261118    gcc-14
x86_64                randconfig-1016-20261118    gcc-14
x86_64                randconfig-1017-20261118    gcc-14
x86_64                randconfig-2000-20261117    gcc-14
x86_64                randconfig-2000-20261118    gcc-13
x86_64                randconfig-2001-20261117    gcc-14
x86_64                randconfig-2001-20261118    gcc-13
x86_64                randconfig-2002-20261117    gcc-14
x86_64                randconfig-2002-20261118    gcc-13
x86_64                randconfig-2003-20261117    gcc-14
x86_64                randconfig-2003-20261118    gcc-13
x86_64                randconfig-2004-20261117    gcc-14
x86_64                randconfig-2004-20261118    gcc-13
x86_64                randconfig-2005-20261117    gcc-14
x86_64                randconfig-2005-20261118    gcc-13
x86_64                randconfig-2100-20261117    gcc-14     cocci
x86_64                randconfig-2100-20261118    clang-22   cocci
x86_64                randconfig-2101-20261117    gcc-14     cocci
x86_64                randconfig-2101-20261118    clang-22   cocci
x86_64                randconfig-2102-20261117    gcc-14     cocci
x86_64                randconfig-2102-20261118    clang-22   cocci
x86_64                randconfig-2103-20261117    gcc-14     cocci
x86_64                randconfig-2103-20261118    clang-22   cocci
x86_64                randconfig-2104-20261117    gcc-14     cocci
x86_64                randconfig-2104-20261118    clang-22   cocci
x86_64                randconfig-2105-20261117    gcc-14     cocci
x86_64                randconfig-2105-20261118    clang-22   cocci
x86_64                randconfig-2200-20261117    gcc-14     smatch
x86_64                randconfig-2200-20261118    clang-22   smatch
x86_64                randconfig-2300-20261117    clang-22   sparse
x86_64                randconfig-2300-20261118    gcc-14     sparse
x86_64                randconfig-2301-20261117    clang-22   sparse
x86_64                randconfig-2301-20261118    gcc-14     sparse
x86_64                randconfig-2302-20261117    clang-22   sparse
x86_64                randconfig-2302-20261118    gcc-14     sparse
x86_64               randconfig-r2106-20261117    gcc-13.5.0 cocci
x86_64               randconfig-r2106-20261117    gcc-14     cocci
x86_64               randconfig-r2109-20261117    gcc-13.5.0 cocci
x86_64               randconfig-r2109-20261118    gcc-14     cocci
x86_64               randconfig-r2309-20261117    gcc-9.5.0  sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-2000-20261117    gcc-16.2.0
xtensa                randconfig-2000-20261118    gcc-16.2.0
xtensa                randconfig-2001-20261117    gcc-16.2.0
xtensa                randconfig-2001-20261118    gcc-16.2.0
xtensa                randconfig-2200-20261117    gcc-8.5.0  smatch
xtensa                randconfig-2200-20261118    gcc-15.3.0 smatch
xtensa               randconfig-r2308-20261118    gcc-8.5.0  sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
