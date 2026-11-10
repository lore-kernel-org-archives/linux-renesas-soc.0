Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270831;
	b=BPcEnLGl/xLTYJlLyq8NBB/7iqwWvbs3M4RKXNb6daLOQ1iTXiMBFqr3Qr+vadcuVw/7
	 vsn5awCYG1vYukRtqT5jLvvOhhmCqlSZKflUfYjfBuW+fQccPdax16snBs/YhFH56cn1k
	 YBRZrYS2e9vo2jtuOR7iheqB5VqJtYYB1yd+5U+ppVkCAg0jYia5pitZ2AUGVxh9qOie+
	 MyeYx4VDFfMGPFS7lt82B6D6hxpCX7Fn93qRm5OIft/bjAzemJynVIYPwecnfuguym9yt
	 gBI2PFcNyH1W/avDEvFeVwKw/dV/A78Qy7vmOB13m7Cr8tghEAOC0R9PZXiPK0ZusoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270831;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LpF9fVPbYZoluJFxS0hVygwLMfKpIzXzPye4+wkLa/o=;
	b=Cvcw5WQMffxeMXsg8JdNeaSW8FSAe2ZRV8u2LiMiZHj+Hb04A4Fqp0M8dAD6j27YNVde
	 qKxG4SXilymhj3CUc/itY4NCupEJY9hCGEVXuB0zqLDaVgFcgm6uqlL6gY11AUcJ18w5q
	 nbawnwR8mgddLXG7tWrRRyKnh1zky++T2eop2a0dsh+j3XwsEnADYAqhqjVPEdrsvqEz+
	 JfksoTroQnbWLvCNOw3y4NSLufUEbIxgfIFLDIDzh1MPZFZvQ3yd7cVT59geSYZXYMpFe
	 dxjAUXl+zEVlvohWQhly3DKBTxetmkq12mHTOQln8njuhUIx7Tc0U2tcxqhAjkh6c7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LwJN3on6;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D984606A326
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 00:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D984606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LwJN3on6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794270831; x=1825806831;
  h=date:from:to:cc:subject:message-id;
  bh=sz1Yxz1TCc+habMzJLwTk9z7vGoQNGoGIWF9xr2J/gw=;
  b=LwJN3on6oM7sOYY1Hifr+ca4h6MnwuQCKjddss3AR4Q6tyLRsNH41s4o
   j7LaIS3DAGjmyO+7GlXrI+lhatWKlR+PwIF+NV9RyEXn7cCcLbSmhaQV0
   28re0MeeUulitirXKmAvjaE3W22AiWrmQMd1Qa3du/qeJiLDPQXLmOhY6
   YFR5tJ3og8lFC52YIxRcWl5w7n2B7yDjrdqgW+sBNTQxM0MDZ45zrIS7x
   6akaTHbp5ICyonft4yTGWT07C41YwPzMHIQJ5AWiIFlmY3A9SMxQgschW
   abPRb8V+02tCm4EKLuhJFvAoMDfzfgTw3OHDsEtzWJOexceR8zTGl2NmH
   g==;
X-CSE-ConnectionGUID: K3bGkHODTv6dC6dN5M6Yzw==
X-CSE-MsgGUID: rg9wHR/eQGeqt3pF6XupcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2899730"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2899730"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 16:33:49 -0800
X-CSE-ConnectionGUID: m4f2/+LwSV2mAyh1Uvpuzg==
X-CSE-MsgGUID: GsJODPHfSbSR6/usZGAxiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8333348"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Nov 2026 16:33:49 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQZo1-00000000vd5-2sJc;
	Tue, 10 Nov 2026 00:33:45 +0000
Date: Tue, 10 Nov 2026 08:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 c623cacb8ef5bbc801f71b6a0ac1a21c8e18f7d6
Message-ID: <20261110083319.isT1TKVR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: c623cacb8ef5bbc801f71b6a0ac1a21c8e18f7d6  Merge branches 'renesas-next' and 'topic/renesas-defconfig', tag 'v7.4-rc2' into renesas-devel

elapsed time: 828m

configs tested: 482
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                randconfig-r2103-20261109    gcc-8.5.0  cocci
alpha                randconfig-r2107-20261109    gcc-11.5.0 cocci
alpha                randconfig-r2111-20261109    gcc-11.5.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261109    clang-24
arc                   randconfig-1000-20261110    gcc-10.5.0
arc                   randconfig-1001-20261109    clang-24
arc                   randconfig-1001-20261110    gcc-10.5.0
arc                   randconfig-2000-20261109    gcc-8.5.0
arc                   randconfig-2001-20261109    gcc-8.5.0
arc                   randconfig-2002-20261109    gcc-8.5.0
arc                   randconfig-2003-20261109    gcc-8.5.0
arc                   randconfig-2004-20261109    gcc-8.5.0
arc                   randconfig-2005-20261109    gcc-8.5.0
arc                   randconfig-2200-20261109    gcc-13.5.0 smatch
arc                  randconfig-r2105-20261109    clang-24   cocci
arc                  randconfig-r2301-20261109    gcc-11.5.0 sparse
arc                            tb10x_defconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.2.0
arm                          axm55xx_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                           gemini_defconfig    clang-17
arm                       integrator_defconfig    clang-17
arm                          lpc32xx_defconfig    clang-17
arm                             mmp2_defconfig    gcc-16.2.0
arm                         multi_v7_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261109    clang-24
arm                   randconfig-1000-20261110    gcc-10.5.0
arm                   randconfig-1001-20261109    clang-24
arm                   randconfig-1001-20261110    gcc-10.5.0
arm                   randconfig-1002-20261109    clang-24
arm                   randconfig-1002-20261110    gcc-10.5.0
arm                   randconfig-1003-20261109    clang-24
arm                   randconfig-1003-20261110    gcc-10.5.0
arm                   randconfig-2000-20261109    gcc-10.5.0
arm                   randconfig-2001-20261109    gcc-10.5.0
arm                   randconfig-2002-20261109    gcc-10.5.0
arm                   randconfig-2200-20261109    clang-20   smatch
arm                  randconfig-r2105-20261109    gcc-8.5.0  cocci
arm                  randconfig-r2111-20261109    gcc-11.5.0 cocci
arm                  randconfig-r2300-20261109    clang-24   sparse
arm                  randconfig-r2309-20261109    gcc-13.5.0 sparse
arm                           sp7021_defconfig    gcc-16.2.0
arm                          vf610m4_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261109    gcc-13.5.0
arm64                 randconfig-1000-20261110    gcc-12.5.0
arm64                 randconfig-1001-20261109    gcc-13.5.0
arm64                 randconfig-1001-20261110    gcc-12.5.0
arm64                 randconfig-1002-20261109    gcc-13.5.0
arm64                 randconfig-1002-20261110    gcc-12.5.0
arm64                 randconfig-1003-20261109    gcc-13.5.0
arm64                 randconfig-1003-20261110    gcc-12.5.0
arm64                 randconfig-2000-20261109    gcc-10.5.0
arm64                 randconfig-2001-20261109    gcc-10.5.0
arm64                 randconfig-2002-20261109    gcc-10.5.0
arm64                 randconfig-2200-20261109    gcc-10.5.0 smatch
arm64                randconfig-r2102-20261109    gcc-16.2.0 cocci
arm64                randconfig-r2301-20261109    clang-17   sparse
arm64                randconfig-r2305-20261109    clang-24   sparse
arm64                randconfig-r2310-20261109    gcc-13.5.0 sparse
arm64                randconfig-r2311-20261109    gcc-15.3.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261109    gcc-13.5.0
csky                  randconfig-1000-20261110    gcc-12.5.0
csky                  randconfig-1001-20261109    gcc-13.5.0
csky                  randconfig-1001-20261110    gcc-12.5.0
csky                  randconfig-2000-20261109    clang-17
csky                  randconfig-2001-20261109    clang-17
csky                  randconfig-2200-20261109    gcc-16.2.0 smatch
csky                 randconfig-r2100-20261109    gcc-16.2.0 cocci
csky                 randconfig-r2107-20261109    gcc-11.5.0 cocci
csky                 randconfig-r2309-20261109    gcc-11.5.0 sparse
csky                 randconfig-r2310-20261109    gcc-11.5.0 sparse
csky                 randconfig-r2311-20261109    gcc-13.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261109    clang-19
hexagon               randconfig-1000-20261110    clang-17
hexagon               randconfig-1001-20261109    clang-19
hexagon               randconfig-1001-20261110    clang-17
hexagon               randconfig-2000-20261109    clang-17
hexagon               randconfig-2001-20261109    clang-17
hexagon               randconfig-2200-20261109    clang-17   smatch
hexagon              randconfig-r2107-20261109    clang-24   cocci
hexagon              randconfig-r2303-20261109    clang-17   sparse
hexagon              randconfig-r2304-20261109    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261109    clang-22
i386        buildonly-randconfig-1000-20261110    clang-22
i386        buildonly-randconfig-1001-20261109    clang-22
i386        buildonly-randconfig-1001-20261110    clang-22
i386        buildonly-randconfig-1002-20261109    clang-22
i386        buildonly-randconfig-1002-20261110    clang-22
i386        buildonly-randconfig-1003-20261109    clang-22
i386        buildonly-randconfig-1003-20261110    clang-22
i386        buildonly-randconfig-1004-20261109    clang-22
i386        buildonly-randconfig-1004-20261110    clang-22
i386        buildonly-randconfig-1005-20261109    clang-22
i386        buildonly-randconfig-1005-20261110    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261109    gcc-14
i386                  randconfig-1000-20261110    gcc-14
i386                  randconfig-1001-20261109    gcc-14
i386                  randconfig-1001-20261110    gcc-14
i386                  randconfig-1002-20261109    gcc-14
i386                  randconfig-1002-20261110    gcc-14
i386                  randconfig-1003-20261109    gcc-14
i386                  randconfig-1003-20261110    gcc-14
i386                  randconfig-1004-20261109    gcc-14
i386                  randconfig-1004-20261110    gcc-14
i386                  randconfig-1005-20261109    gcc-14
i386                  randconfig-1005-20261110    gcc-14
i386                  randconfig-1006-20261109    gcc-14
i386                  randconfig-1006-20261110    gcc-14
i386                  randconfig-1007-20261109    gcc-12
i386                  randconfig-1007-20261110    clang-22
i386                  randconfig-1008-20261109    gcc-12
i386                  randconfig-1008-20261110    clang-22
i386                  randconfig-1009-20261109    gcc-12
i386                  randconfig-1009-20261110    clang-22
i386                  randconfig-1010-20261109    gcc-12
i386                  randconfig-1010-20261110    clang-22
i386                  randconfig-1011-20261109    gcc-12
i386                  randconfig-1011-20261110    clang-22
i386                  randconfig-1012-20261109    gcc-12
i386                  randconfig-1012-20261110    clang-22
i386                  randconfig-1013-20261109    gcc-12
i386                  randconfig-1013-20261110    clang-22
i386                  randconfig-2000-20261109    clang-22
i386                  randconfig-2001-20261109    clang-22
i386                  randconfig-2002-20261109    clang-22
i386                  randconfig-2003-20261109    clang-22
i386                  randconfig-2004-20261109    clang-22
i386                  randconfig-2005-20261109    clang-22
i386                  randconfig-2100-20261109    gcc-14     cocci
i386                  randconfig-2101-20261109    gcc-14     cocci
i386                  randconfig-2102-20261109    gcc-14     cocci
i386                  randconfig-2103-20261109    gcc-14     cocci
i386                  randconfig-2104-20261109    gcc-14     cocci
i386                  randconfig-2105-20261109    gcc-14     cocci
i386                  randconfig-2200-20261109    clang-22   smatch
i386                 randconfig-r2101-20261109    clang-24   cocci
i386                 randconfig-r2102-20261109    gcc-8.5.0  cocci
i386                 randconfig-r2300-20261109    gcc-11.5.0 sparse
i386                 randconfig-r2302-20261109    gcc-11.5.0 sparse
i386                 randconfig-r2304-20261109    gcc-11.5.0 sparse
i386                 randconfig-r2307-20261109    gcc-13.5.0 sparse
i386                 randconfig-r2309-20261109    gcc-15.3.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261109    clang-19
loongarch             randconfig-1000-20261110    clang-17
loongarch             randconfig-1001-20261109    clang-19
loongarch             randconfig-1001-20261110    clang-17
loongarch             randconfig-2000-20261109    clang-18
loongarch             randconfig-2001-20261109    clang-18
loongarch             randconfig-2200-20261109    gcc-16.2.0 smatch
loongarch            randconfig-r2104-20261109    clang-24   cocci
loongarch            randconfig-r2300-20261109    gcc-11.5.0 sparse
loongarch            randconfig-r2302-20261109    clang-17   sparse
loongarch            randconfig-r2303-20261109    clang-24   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5307c3_defconfig    clang-24
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                       m54418evb_defconfig    gcc-16.2.0
m68k                  randconfig-2200-20261109    gcc-12.5.0 smatch
m68k                 randconfig-r2101-20261109    gcc-16.2.0 cocci
m68k                 randconfig-r2105-20261109    gcc-16.2.0 cocci
m68k                 randconfig-r2307-20261109    gcc-11.5.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2200-20261109    gcc-9.5.0  smatch
microblaze           randconfig-r2110-20261109    gcc-16.2.0 cocci
microblaze           randconfig-r2301-20261109    clang-24   sparse
microblaze           randconfig-r2306-20261109    clang-24   sparse
microblaze           randconfig-r2306-20261109    gcc-15.3.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                   decstation_64_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                             gpr_defconfig    clang-24
mips                            ip27_defconfig    clang-17
mips                            jazz_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261109    gcc-8.5.0
mips                  randconfig-2001-20261109    gcc-8.5.0
mips                  randconfig-2002-20261109    gcc-8.5.0
mips                  randconfig-2200-20261109    gcc-11.5.0 smatch
mips                 randconfig-r2108-20261109    gcc-11.5.0 cocci
mips                 randconfig-r2109-20261109    gcc-11.5.0 cocci
mips                 randconfig-r2110-20261109    gcc-11.5.0 cocci
mips                 randconfig-r2307-20261109    gcc-15.3.0 sparse
mips                 randconfig-r2308-20261109    gcc-11.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261109    clang-19
nios2                 randconfig-1000-20261110    clang-17
nios2                 randconfig-1001-20261109    clang-19
nios2                 randconfig-1001-20261110    clang-17
nios2                 randconfig-2000-20261109    clang-18
nios2                 randconfig-2001-20261109    clang-18
nios2                 randconfig-2200-20261109    gcc-11.5.0 smatch
nios2                randconfig-r2107-20261109    gcc-16.2.0 cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261109    gcc-8.5.0
openrisc              randconfig-2001-20261109    gcc-8.5.0
openrisc              randconfig-2002-20261109    gcc-8.5.0
openrisc              randconfig-2200-20261109    gcc-13.5.0 smatch
openrisc             randconfig-r2102-20261109    clang-24   cocci
openrisc             randconfig-r2103-20261109    gcc-16.2.0 cocci
openrisc             randconfig-r2106-20261109    gcc-16.2.0 cocci
openrisc             randconfig-r2300-20261109    clang-17   sparse
openrisc             randconfig-r2305-20261109    gcc-11.5.0 sparse
openrisc             randconfig-r2308-20261109    gcc-15.3.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261109    gcc-8.5.0
parisc                randconfig-1000-20261110    gcc-14.4.0
parisc                randconfig-1001-20261109    gcc-8.5.0
parisc                randconfig-1001-20261110    gcc-14.4.0
parisc                randconfig-2000-20261109    clang-18
parisc                randconfig-2001-20261109    clang-18
parisc                randconfig-2200-20261109    gcc-15.3.0 smatch
parisc               randconfig-r2100-20261109    gcc-8.5.0  cocci
parisc               randconfig-r2105-20261109    gcc-8.5.0  cocci
parisc               randconfig-r2111-20261109    gcc-16.2.0 cocci
parisc               randconfig-r2301-20261109    gcc-11.5.0 sparse
parisc64                          alldefconfig    gcc-16.2.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                     ge_imp3a_defconfig    gcc-16.2.0
powerpc                      kmeter1_defconfig    gcc-16.2.0
powerpc                      powernv_defconfig    clang-17
powerpc                      ppa8548_defconfig    clang-17
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261109    gcc-8.5.0
powerpc               randconfig-1000-20261110    gcc-14.4.0
powerpc               randconfig-1001-20261109    gcc-8.5.0
powerpc               randconfig-1001-20261110    gcc-14.4.0
powerpc               randconfig-2000-20261109    clang-24
powerpc               randconfig-2001-20261109    clang-24
powerpc               randconfig-2002-20261109    clang-24
powerpc               randconfig-2200-20261109    gcc-8.5.0  smatch
powerpc              randconfig-r2302-20261109    gcc-11.5.0 sparse
powerpc              randconfig-r2306-20261109    gcc-11.5.0 sparse
powerpc              randconfig-r2308-20261109    clang-24   sparse
powerpc                         warp_defconfig    clang-17
powerpc                         warp_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261109    gcc-8.5.0
powerpc64             randconfig-1000-20261110    gcc-14.4.0
powerpc64             randconfig-1001-20261109    gcc-8.5.0
powerpc64             randconfig-1001-20261110    gcc-14.4.0
powerpc64             randconfig-2000-20261109    clang-24
powerpc64             randconfig-2001-20261109    clang-24
powerpc64             randconfig-2002-20261109    clang-24
powerpc64             randconfig-2200-20261109    gcc-14.4.0 smatch
powerpc64            randconfig-r2104-20261109    gcc-16.2.0 cocci
powerpc64            randconfig-r2304-20261109    clang-17   sparse
powerpc64            randconfig-r2304-20261109    gcc-11.5.0 sparse
powerpc64            randconfig-r2310-20261109    gcc-15.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261109    gcc-8.5.0
riscv                 randconfig-1000-20261110    clang-24
riscv                 randconfig-1001-20261109    gcc-8.5.0
riscv                 randconfig-1001-20261110    clang-24
riscv                 randconfig-2000-20261109    gcc-14.4.0
riscv                 randconfig-2001-20261109    gcc-14.4.0
riscv                 randconfig-2002-20261109    gcc-14.4.0
riscv                 randconfig-2003-20261109    gcc-14.4.0
riscv                 randconfig-2004-20261109    gcc-14.4.0
riscv                 randconfig-2005-20261109    gcc-14.4.0
riscv                randconfig-r2102-20261109    gcc-8.5.0  cocci
riscv                randconfig-r2305-20261109    gcc-11.5.0 sparse
riscv                randconfig-r2307-20261109    clang-24   sparse
riscv                randconfig-r2310-20261109    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    clang-24
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261109    gcc-8.5.0
s390                  randconfig-1000-20261110    clang-24
s390                  randconfig-1001-20261109    gcc-8.5.0
s390                  randconfig-1001-20261110    clang-24
s390                  randconfig-2000-20261109    gcc-8.5.0
s390                  randconfig-2001-20261109    gcc-8.5.0
s390                  randconfig-2002-20261109    gcc-8.5.0
s390                  randconfig-2003-20261109    gcc-8.5.0
s390                  randconfig-2004-20261109    gcc-8.5.0
s390                  randconfig-2005-20261109    gcc-8.5.0
s390                  randconfig-2200-20261109    clang-24   smatch
s390                 randconfig-r2103-20261109    clang-24   cocci
s390                 randconfig-r2305-20261109    clang-17   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                         apsh4ad0a_defconfig    clang-24
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261109    gcc-8.5.0
sh                    randconfig-1000-20261110    clang-24
sh                    randconfig-1001-20261109    gcc-8.5.0
sh                    randconfig-1001-20261110    clang-24
sh                    randconfig-2000-20261109    gcc-16.2.0
sh                    randconfig-2001-20261109    gcc-16.2.0
sh                    randconfig-2002-20261109    gcc-16.2.0
sh                    randconfig-2003-20261109    gcc-16.2.0
sh                    randconfig-2004-20261109    gcc-16.2.0
sh                    randconfig-2005-20261109    gcc-16.2.0
sh                    randconfig-2200-20261109    gcc-9.5.0  smatch
sh                   randconfig-r2106-20261109    gcc-11.5.0 cocci
sh                   randconfig-r2108-20261109    gcc-11.5.0 cocci
sh                   randconfig-r2311-20261109    gcc-11.5.0 sparse
sh                           rsk7201_defconfig    clang-24
sh                            se7751_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261109    gcc-8.5.0
sparc                 randconfig-1000-20261110    gcc-12.5.0
sparc                 randconfig-1001-20261109    gcc-8.5.0
sparc                 randconfig-1001-20261110    gcc-12.5.0
sparc                 randconfig-2000-20261109    gcc-14
sparc                 randconfig-2001-20261109    gcc-14
sparc                randconfig-r2106-20261109    gcc-11.5.0 cocci
sparc                randconfig-r2109-20261109    gcc-16.2.0 cocci
sparc                randconfig-r2110-20261109    gcc-11.5.0 cocci
sparc                randconfig-r2303-20261109    gcc-11.5.0 sparse
sparc                randconfig-r2308-20261109    gcc-13.5.0 sparse
sparc                randconfig-r2311-20261109    clang-24   sparse
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261109    gcc-8.5.0
sparc64               randconfig-1000-20261110    gcc-12.5.0
sparc64               randconfig-1001-20261109    gcc-8.5.0
sparc64               randconfig-1001-20261110    gcc-12.5.0
sparc64               randconfig-2000-20261109    gcc-14
sparc64               randconfig-2001-20261109    gcc-14
sparc64               randconfig-2200-20261109    clang-24   smatch
sparc64              randconfig-r2100-20261109    clang-24   cocci
sparc64              randconfig-r2103-20261109    gcc-8.5.0  cocci
sparc64              randconfig-r2108-20261109    gcc-16.2.0 cocci
sparc64              randconfig-r2109-20261109    gcc-11.5.0 cocci
sparc64              randconfig-r2306-20261109    gcc-13.5.0 sparse
sparc64              randconfig-r2309-20261109    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-16.2.0
um                    randconfig-1000-20261109    gcc-8.5.0
um                    randconfig-1000-20261110    gcc-12.5.0
um                    randconfig-1001-20261109    gcc-8.5.0
um                    randconfig-1001-20261110    gcc-12.5.0
um                    randconfig-2000-20261109    gcc-14
um                    randconfig-2001-20261109    gcc-14
um                    randconfig-2200-20261109    clang-24   smatch
um                   randconfig-r2101-20261109    gcc-8.5.0  cocci
um                   randconfig-r2104-20261109    gcc-8.5.0  cocci
um                   randconfig-r2106-20261109    clang-24   cocci
um                   randconfig-r2108-20261109    clang-24   cocci
um                   randconfig-r2111-20261109    clang-24   cocci
um                   randconfig-r2302-20261109    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261109    clang-22
x86_64      buildonly-randconfig-1000-20261110    gcc-14
x86_64      buildonly-randconfig-1001-20261109    clang-22
x86_64      buildonly-randconfig-1001-20261110    gcc-14
x86_64      buildonly-randconfig-1002-20261109    clang-22
x86_64      buildonly-randconfig-1002-20261110    gcc-14
x86_64      buildonly-randconfig-1003-20261109    clang-22
x86_64      buildonly-randconfig-1003-20261110    gcc-14
x86_64      buildonly-randconfig-1004-20261109    clang-22
x86_64      buildonly-randconfig-1004-20261110    gcc-14
x86_64      buildonly-randconfig-1005-20261109    clang-22
x86_64      buildonly-randconfig-1005-20261110    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261109    clang-22
x86_64                randconfig-1000-20261110    gcc-14
x86_64                randconfig-1001-20261109    clang-22
x86_64                randconfig-1001-20261110    gcc-14
x86_64                randconfig-1002-20261109    clang-22
x86_64                randconfig-1002-20261110    gcc-14
x86_64                randconfig-1003-20261109    clang-22
x86_64                randconfig-1003-20261110    gcc-14
x86_64                randconfig-1004-20261109    clang-22
x86_64                randconfig-1004-20261110    gcc-14
x86_64                randconfig-1005-20261109    clang-22
x86_64                randconfig-1005-20261110    gcc-14
x86_64                randconfig-1006-20261109    gcc-14
x86_64                randconfig-1006-20261110    gcc-14
x86_64                randconfig-1007-20261109    gcc-14
x86_64                randconfig-1007-20261110    gcc-14
x86_64                randconfig-1008-20261109    gcc-14
x86_64                randconfig-1008-20261110    gcc-14
x86_64                randconfig-1009-20261109    gcc-14
x86_64                randconfig-1009-20261110    gcc-14
x86_64                randconfig-1010-20261109    gcc-14
x86_64                randconfig-1010-20261110    gcc-14
x86_64                randconfig-1011-20261109    gcc-14
x86_64                randconfig-1011-20261110    gcc-14
x86_64                randconfig-1012-20261110    gcc-14
x86_64                randconfig-1013-20261110    gcc-14
x86_64                randconfig-1014-20261110    gcc-14
x86_64                randconfig-1015-20261110    gcc-14
x86_64                randconfig-1016-20261110    gcc-14
x86_64                randconfig-1017-20261110    gcc-14
x86_64                randconfig-2000-20261109    clang-22
x86_64                randconfig-2001-20261109    clang-22
x86_64                randconfig-2002-20261109    clang-22
x86_64                randconfig-2003-20261109    clang-22
x86_64                randconfig-2004-20261109    clang-22
x86_64                randconfig-2005-20261109    clang-22
x86_64                randconfig-2100-20261109    clang-22   cocci
x86_64                randconfig-2101-20261109    clang-22   cocci
x86_64                randconfig-2102-20261109    clang-22   cocci
x86_64                randconfig-2103-20261109    clang-22   cocci
x86_64                randconfig-2104-20261109    clang-22   cocci
x86_64                randconfig-2105-20261109    clang-22   cocci
x86_64                randconfig-2200-20261109    clang-22   smatch
x86_64               randconfig-r2104-20261109    gcc-8.5.0  cocci
x86_64               randconfig-r2109-20261109    clang-24   cocci
x86_64               randconfig-r2110-20261109    clang-24   cocci
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
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261109    gcc-8.5.0
xtensa                randconfig-1000-20261110    gcc-12.5.0
xtensa                randconfig-1001-20261109    gcc-8.5.0
xtensa                randconfig-1001-20261110    gcc-12.5.0
xtensa                randconfig-2000-20261109    clang-17
xtensa                randconfig-2001-20261109    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
