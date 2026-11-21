Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795226204;
	b=R/Pv3dxdJHVe458+tM+T1FCnVkAtMMJMRhLqvFzmXh1/5ZiCCzfhT1yzGe/TcUv2N/V1
	 Xjz8RMTud978wtsfVEpoD69t55VcVM2CWreq0HnpSx2zbRGAUtgZNnab5c47EoQUll1Jh
	 lWaIveR+8PLPcuJ8FUBOLP5dLnbq+6IZIpBF9xZ6WtWlcCMUhq9AJ2vxrGHt1kZSoFE6s
	 z+O9sTWafarmyM07xcTiW9ULEziFVzYEVDfhbLIAdfl3F7NE0s6lGX2TuuvesZhlNrrXO
	 S2glT2/OzqMRXUtZi4AqB9Umo0iJhYhtPe6keVcuC9HPqhQPhH0JmDpSwwsYbpCnvZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795226204;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mJyWUm0ntaFHIkJ1uUMUR1kD7sIalPGLW7GBSjZHiwQ=;
	b=js3FFVnlzL/b1g+mACq19V7W7kIZIjuXsLdcZRY81CQFpvm65Oo33aKxZcRkORxF80JP
	 toe02QajkNJySc8+4e8XrCTc8eyYAZsfaVz66WnYC7eLlWvOi0rex5GptztWIGDsjMzut
	 j941K+J6PaWdNUOcNRrfMaLMYCz9Vk81PYvM7z6piC0PR1kulsGBnbJlF8+Ny25+BBugC
	 WFe2WgAbsgsO7qZr9sDtC3zPq+kc9kTtuFXfViN9ERV/G8dmXwt75I86Rl1O6wwHjdDHs
	 82HFpTybcMwnfV7waht+0CPXYMtI5kFjSEgSHxR0+EDNUestrkqmvoKmu0f/jR/GSQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fZylfuZ2;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961D3606A6BC
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Nov 2026 01:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 961D3606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fZylfuZ2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795226200; x=1826762200;
  h=date:from:to:cc:subject:message-id;
  bh=jSNHAg0x97uJVkQTm7thkCqQ+BKK6Ilf2IQwi6NAybg=;
  b=fZylfuZ2GVR+BUyJ14/x9PrghcdQoL+AmXrfBT3mNEEaxXekQsUumBfK
   z1Qy0JzLiskdl/vgMFfuhV8JZMYulUcN+vrb1h4lC57VxSemPt37rFQ7Q
   FIOJDAdZd1am3epeca5PFMWjeuVF5c/VAfvgxP0AL6Lt4P8WK38mZsPp3
   a2WMbCEDUMBGGzYx7fHgzKNvFzXyiNaMugxAJUwyle98JEC/B6wFkVZkW
   fBTIaKtcyYiDT4YeyZOMrD4vVLWy/zBxfC3bCimzEV2sFnFp1dRFKqMjy
   CybB19jQ149hU+dfahHY+PlTWLnMizbpZKDvpOywPtvdG5fDpWFwoRuOv
   Q==;
X-CSE-ConnectionGUID: K5YpHAroS/ikLPR+NnhwEQ==
X-CSE-MsgGUID: pxfthYUHSdSPdTdHrMDxoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4214250"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4214250"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 17:56:39 -0800
X-CSE-ConnectionGUID: kapgYD+vR2K0U2i3lgbrjQ==
X-CSE-MsgGUID: wErmdxXDSq2hzC1kelWWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10725765"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2026 17:56:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUaLD-00000001JD1-1Dug;
	Sat, 21 Nov 2026 01:56:35 +0000
Date: Sat, 21 Nov 2026 09:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: 
 [geert-renesas-drivers:topic:rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v5]
 BUILD SUCCESS 8bfa8e59ec3536c8dcb52e9ab5b6dec5b135c094
Message-ID: <20261121095622.hHsSJimt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v5
branch HEAD: 8bfa8e59ec3536c8dcb52e9ab5b6dec5b135c094  --- Renesas R-Car X5H Ironhide RTCA ------------------- ---

elapsed time: 1251m

configs tested: 590
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                 randconfig-2000-20261118    gcc-16.2.0
alpha                 randconfig-2000-20261119    gcc-8.5.0
alpha                 randconfig-2001-20261118    gcc-16.2.0
alpha                 randconfig-2001-20261119    gcc-8.5.0
alpha                 randconfig-2200-20261118    gcc-13.5.0 smatch
alpha                 randconfig-2200-20261119    gcc-12.5.0 smatch
alpha                randconfig-r2102-20261119    gcc-16.2.0 cocci
alpha                randconfig-r2103-20261119    gcc-16.2.0 cocci
alpha                randconfig-r2304-20261118    gcc-8.5.0  sparse
alpha                randconfig-r2306-20261118    gcc-14.4.0 sparse
alpha                randconfig-r2306-20261119    gcc-14     sparse
alpha                randconfig-r2307-20261119    gcc-10.5.0 sparse
alpha                randconfig-r2311-20261119    gcc-11.5.0 sparse
alpha                randconfig-r2311-20261119    gcc-14.4.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                   randconfig-1000-20261120    clang-17
arc                   randconfig-1000-20261121    clang-24
arc                   randconfig-1001-20261120    clang-17
arc                   randconfig-1001-20261121    clang-24
arc                   randconfig-2000-20261118    gcc-11.5.0
arc                   randconfig-2000-20261119    gcc-14.4.0
arc                   randconfig-2001-20261118    gcc-11.5.0
arc                   randconfig-2001-20261119    gcc-14.4.0
arc                   randconfig-2002-20261118    gcc-11.5.0
arc                   randconfig-2002-20261119    gcc-14.4.0
arc                   randconfig-2003-20261118    gcc-11.5.0
arc                   randconfig-2003-20261119    gcc-14.4.0
arc                   randconfig-2004-20261118    gcc-11.5.0
arc                   randconfig-2004-20261119    gcc-14.4.0
arc                   randconfig-2005-20261118    gcc-11.5.0
arc                   randconfig-2005-20261119    gcc-14.4.0
arc                   randconfig-2200-20261118    gcc-9.5.0  smatch
arc                   randconfig-2200-20261119    gcc-16.2.0 smatch
arc                  randconfig-r2301-20261119    gcc-16.2.0 sparse
arc                  randconfig-r2308-20261119    gcc-14     sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         multi_v7_defconfig    clang-17
arm                   randconfig-1000-20261120    clang-17
arm                   randconfig-1000-20261121    clang-24
arm                   randconfig-1001-20261120    clang-17
arm                   randconfig-1001-20261121    clang-24
arm                   randconfig-1002-20261120    clang-17
arm                   randconfig-1002-20261121    clang-24
arm                   randconfig-1003-20261120    clang-17
arm                   randconfig-1003-20261121    clang-24
arm                   randconfig-2000-20261118    gcc-13.5.0
arm                   randconfig-2000-20261119    gcc-16.2.0
arm                   randconfig-2001-20261118    gcc-13.5.0
arm                   randconfig-2001-20261119    gcc-16.2.0
arm                   randconfig-2002-20261118    gcc-13.5.0
arm                   randconfig-2002-20261119    gcc-16.2.0
arm                   randconfig-2200-20261118    gcc-8.5.0  smatch
arm                   randconfig-2200-20261119    clang-24   smatch
arm                  randconfig-r2103-20261118    clang-17   cocci
arm                  randconfig-r2105-20261119    gcc-16.2.0 cocci
arm                  randconfig-r2302-20261119    gcc-15.3.0 sparse
arm                  randconfig-r2305-20261119    gcc-13.5.0 sparse
arm                  randconfig-r2306-20261119    gcc-10.5.0 sparse
arm                  randconfig-r2308-20261119    gcc-14.4.0 sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                 randconfig-1000-20261120    clang-18
arm64                 randconfig-1001-20261120    clang-18
arm64                 randconfig-1002-20261120    clang-18
arm64                 randconfig-1003-20261120    clang-18
arm64                 randconfig-2000-20261118    gcc-13.5.0
arm64                 randconfig-2000-20261119    gcc-16.2.0
arm64                 randconfig-2001-20261118    gcc-13.5.0
arm64                 randconfig-2001-20261119    gcc-16.2.0
arm64                 randconfig-2002-20261118    gcc-13.5.0
arm64                 randconfig-2002-20261119    gcc-16.2.0
arm64                 randconfig-2200-20261118    clang-24   smatch
arm64                 randconfig-2200-20261119    clang-17   smatch
arm64                randconfig-r2100-20261119    gcc-11.5.0 cocci
arm64                randconfig-r2101-20261119    clang-19   cocci
arm64                randconfig-r2102-20261119    gcc-11.5.0 cocci
arm64                randconfig-r2104-20261119    gcc-16.2.0 cocci
arm64                randconfig-r2106-20261119    gcc-14     cocci
arm64                randconfig-r2109-20261119    gcc-14     cocci
arm64                randconfig-r2301-20261119    gcc-13.5.0 sparse
arm64                randconfig-r2303-20261118    gcc-8.5.0  sparse
arm64                randconfig-r2303-20261119    gcc-8.5.0  sparse
arm64                randconfig-r2305-20261119    gcc-16.2.0 sparse
arm64                randconfig-r2311-20261119    clang-24   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                  randconfig-1000-20261120    clang-18
csky                  randconfig-1001-20261120    clang-18
csky                  randconfig-2000-20261118    gcc-16.2.0
csky                  randconfig-2000-20261119    gcc-16.2.0
csky                  randconfig-2001-20261118    gcc-16.2.0
csky                  randconfig-2001-20261119    gcc-16.2.0
csky                  randconfig-2200-20261118    gcc-16.2.0 smatch
csky                  randconfig-2200-20261119    gcc-16.2.0 smatch
csky                 randconfig-r2101-20261119    gcc-11.5.0 cocci
csky                 randconfig-r2103-20261119    gcc-8.5.0  cocci
csky                 randconfig-r2302-20261119    gcc-16.2.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon               randconfig-1000-20261121    gcc-11.5.0
hexagon               randconfig-1001-20261121    gcc-11.5.0
hexagon               randconfig-2000-20261118    gcc-16.2.0
hexagon               randconfig-2000-20261119    gcc-16.2.0
hexagon               randconfig-2001-20261118    gcc-16.2.0
hexagon               randconfig-2001-20261119    gcc-16.2.0
hexagon               randconfig-2200-20261118    clang-20   smatch
hexagon               randconfig-2200-20261119    clang-17   smatch
hexagon              randconfig-r2102-20261119    gcc-8.5.0  cocci
hexagon              randconfig-r2102-20261119    gcc-9.5.0  cocci
hexagon              randconfig-r2104-20261119    clang-24   cocci
hexagon              randconfig-r2305-20261119    clang-24   sparse
hexagon              randconfig-r2309-20261118    gcc-14.4.0 sparse
hexagon              randconfig-r2309-20261119    gcc-11.5.0 sparse
hexagon              randconfig-r2310-20261119    gcc-11.5.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261120    clang-22
i386        buildonly-randconfig-1000-20261121    gcc-13
i386        buildonly-randconfig-1001-20261120    clang-22
i386        buildonly-randconfig-1001-20261121    gcc-13
i386        buildonly-randconfig-1002-20261120    clang-22
i386        buildonly-randconfig-1002-20261121    gcc-13
i386        buildonly-randconfig-1003-20261120    clang-22
i386        buildonly-randconfig-1003-20261121    gcc-13
i386        buildonly-randconfig-1004-20261120    clang-22
i386        buildonly-randconfig-1004-20261121    gcc-13
i386        buildonly-randconfig-1005-20261120    clang-22
i386        buildonly-randconfig-1005-20261121    gcc-13
i386                  randconfig-1000-20261120    clang-22
i386                  randconfig-1001-20261120    clang-22
i386                  randconfig-1002-20261120    clang-22
i386                  randconfig-1003-20261120    clang-22
i386                  randconfig-1004-20261120    clang-22
i386                  randconfig-1005-20261120    clang-22
i386                  randconfig-1006-20261120    clang-22
i386                  randconfig-1007-20261121    gcc-14
i386                  randconfig-1008-20261121    gcc-14
i386                  randconfig-1009-20261121    gcc-14
i386                  randconfig-1010-20261121    gcc-14
i386                  randconfig-1011-20261121    gcc-14
i386                  randconfig-1012-20261121    gcc-14
i386                  randconfig-1013-20261121    gcc-14
i386                  randconfig-2000-20261118    gcc-14
i386                  randconfig-2000-20261119    gcc-14
i386                  randconfig-2001-20261118    gcc-14
i386                  randconfig-2001-20261119    gcc-14
i386                  randconfig-2002-20261118    gcc-14
i386                  randconfig-2002-20261119    gcc-14
i386                  randconfig-2003-20261118    gcc-14
i386                  randconfig-2003-20261119    gcc-14
i386                  randconfig-2004-20261118    gcc-14
i386                  randconfig-2004-20261119    gcc-14
i386                  randconfig-2005-20261118    gcc-14
i386                  randconfig-2005-20261119    gcc-14
i386                  randconfig-2100-20261118    gcc-14     cocci
i386                  randconfig-2100-20261119    clang-22   cocci
i386                  randconfig-2101-20261118    gcc-14     cocci
i386                  randconfig-2101-20261119    clang-22   cocci
i386                  randconfig-2102-20261118    gcc-14     cocci
i386                  randconfig-2102-20261119    clang-22   cocci
i386                  randconfig-2103-20261118    gcc-14     cocci
i386                  randconfig-2103-20261119    clang-22   cocci
i386                  randconfig-2104-20261118    gcc-14     cocci
i386                  randconfig-2104-20261119    clang-22   cocci
i386                  randconfig-2105-20261118    gcc-14     cocci
i386                  randconfig-2105-20261119    clang-22   cocci
i386                  randconfig-2200-20261118    gcc-13     smatch
i386                  randconfig-2200-20261119    gcc-14     smatch
i386                  randconfig-2300-20261118    gcc-14     sparse
i386                  randconfig-2300-20261119    gcc-14     sparse
i386                  randconfig-2301-20261118    gcc-14     sparse
i386                  randconfig-2301-20261119    gcc-14     sparse
i386                  randconfig-2302-20261118    gcc-14     sparse
i386                  randconfig-2302-20261119    gcc-14     sparse
i386                 randconfig-r2100-20261119    gcc-16.2.0 cocci
i386                 randconfig-r2101-20261118    clang-17   cocci
i386                 randconfig-r2104-20261119    gcc-8.5.0  cocci
i386                 randconfig-r2107-20261119    gcc-14     cocci
i386                 randconfig-r2108-20261118    gcc-8.5.0  cocci
i386                 randconfig-r2108-20261119    clang-24   cocci
i386                 randconfig-r2108-20261119    gcc-14     cocci
i386                 randconfig-r2110-20261118    gcc-8.5.0  cocci
i386                 randconfig-r2300-20261118    gcc-8.5.0  sparse
i386                 randconfig-r2300-20261119    gcc-15.3.0 sparse
i386                 randconfig-r2305-20261119    gcc-11.5.0 sparse
i386                 randconfig-r2307-20261119    gcc-11.5.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch             randconfig-1000-20261121    gcc-11.5.0
loongarch             randconfig-1001-20261121    gcc-11.5.0
loongarch             randconfig-2000-20261118    gcc-11.5.0
loongarch             randconfig-2000-20261119    gcc-8.5.0
loongarch             randconfig-2001-20261118    gcc-11.5.0
loongarch             randconfig-2001-20261119    gcc-8.5.0
loongarch             randconfig-2200-20261118    gcc-16.2.0 smatch
loongarch             randconfig-2200-20261119    clang-24   smatch
loongarch            randconfig-r2110-20261119    gcc-10.5.0 cocci
loongarch            randconfig-r2111-20261119    gcc-12.5.0 cocci
loongarch            randconfig-r2303-20261119    gcc-13.5.0 sparse
loongarch            randconfig-r2304-20261119    gcc-16.2.0 sparse
loongarch            randconfig-r2308-20261118    gcc-14.4.0 sparse
loongarch            randconfig-r2309-20261119    clang-24   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           hp300_defconfig    gcc-16.2.0
m68k                        m5275evb_defconfig    clang-17
m68k                  randconfig-2000-20261118    gcc-16.2.0
m68k                  randconfig-2000-20261119    gcc-8.5.0
m68k                  randconfig-2001-20261118    gcc-16.2.0
m68k                  randconfig-2001-20261119    gcc-8.5.0
m68k                  randconfig-2200-20261118    gcc-12.5.0 smatch
m68k                  randconfig-2200-20261119    gcc-9.5.0  smatch
m68k                 randconfig-r2100-20261119    gcc-9.5.0  cocci
m68k                 randconfig-r2104-20261119    gcc-11.5.0 cocci
m68k                 randconfig-r2106-20261118    gcc-8.5.0  cocci
m68k                 randconfig-r2106-20261119    gcc-10.5.0 cocci
m68k                 randconfig-r2111-20261119    gcc-12.5.0 cocci
m68k                 randconfig-r2300-20261119    clang-24   sparse
m68k                 randconfig-r2301-20261118    gcc-8.5.0  sparse
m68k                 randconfig-r2305-20261119    clang-24   sparse
m68k                 randconfig-r2311-20261119    gcc-11.5.0 sparse
m68k                         stmark2_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze            randconfig-2000-20261118    gcc-16.2.0
microblaze            randconfig-2000-20261119    gcc-8.5.0
microblaze            randconfig-2001-20261118    gcc-16.2.0
microblaze            randconfig-2001-20261119    gcc-8.5.0
microblaze            randconfig-2200-20261118    gcc-13.5.0 smatch
microblaze            randconfig-2200-20261119    gcc-12.5.0 smatch
microblaze           randconfig-r2104-20261119    clang-19   cocci
microblaze           randconfig-r2105-20261119    gcc-8.5.0  cocci
microblaze           randconfig-r2107-20261119    gcc-12.5.0 cocci
microblaze           randconfig-r2302-20261119    gcc-8.5.0  sparse
microblaze           randconfig-r2304-20261119    gcc-15.3.0 sparse
microblaze           randconfig-r2305-20261118    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                      cu1000-neo_defconfig    gcc-16.2.0
mips                 econet_en751221_defconfig    clang-17
mips                           eyeq5_defconfig    gcc-16.2.0
mips                            ip32_defconfig    clang-17
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261118    gcc-15.3.0
mips                  randconfig-2000-20261119    gcc-16.2.0
mips                  randconfig-2001-20261118    gcc-15.3.0
mips                  randconfig-2001-20261119    gcc-16.2.0
mips                  randconfig-2002-20261118    gcc-15.3.0
mips                  randconfig-2002-20261119    gcc-16.2.0
mips                  randconfig-2200-20261118    clang-24   smatch
mips                  randconfig-2200-20261119    clang-24   smatch
mips                 randconfig-r2103-20261119    gcc-11.5.0 cocci
mips                 randconfig-r2106-20261119    gcc-12.5.0 cocci
mips                 randconfig-r2107-20261119    clang-24   cocci
mips                 randconfig-r2110-20261119    gcc-14     cocci
mips                 randconfig-r2300-20261119    clang-24   sparse
mips                 randconfig-r2300-20261119    gcc-16.2.0 sparse
mips                 randconfig-r2306-20261119    clang-24   sparse
mips                 randconfig-r2306-20261119    gcc-11.5.0 sparse
mips                 randconfig-r2310-20261119    gcc-11.5.0 sparse
mips                 randconfig-r2310-20261119    gcc-14.4.0 sparse
mips                          rt305x_defconfig    clang-17
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                 randconfig-1000-20261121    gcc-11.5.0
nios2                 randconfig-1001-20261121    gcc-11.5.0
nios2                 randconfig-2000-20261118    gcc-11.5.0
nios2                 randconfig-2000-20261119    gcc-8.5.0
nios2                 randconfig-2001-20261118    gcc-11.5.0
nios2                 randconfig-2001-20261119    gcc-8.5.0
nios2                 randconfig-2200-20261118    gcc-8.5.0  smatch
nios2                 randconfig-2200-20261119    gcc-11.5.0 smatch
nios2                randconfig-r2101-20261119    gcc-8.5.0  cocci
nios2                randconfig-r2101-20261119    gcc-9.5.0  cocci
nios2                randconfig-r2102-20261119    clang-19   cocci
nios2                randconfig-r2104-20261118    clang-17   cocci
nios2                randconfig-r2105-20261119    gcc-9.5.0  cocci
nios2                randconfig-r2106-20261119    gcc-14     cocci
nios2                randconfig-r2109-20261119    gcc-12.5.0 cocci
nios2                randconfig-r2110-20261119    gcc-14     cocci
nios2                randconfig-r2300-20261119    gcc-11.5.0 sparse
nios2                randconfig-r2303-20261119    gcc-11.5.0 sparse
nios2                randconfig-r2303-20261119    gcc-15.3.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    clang-17
openrisc          de0_nano_multicore_defconfig    gcc-16.2.0
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261118    gcc-15.3.0
openrisc              randconfig-2000-20261119    gcc-16.2.0
openrisc              randconfig-2001-20261118    gcc-15.3.0
openrisc              randconfig-2001-20261119    gcc-16.2.0
openrisc              randconfig-2002-20261118    gcc-15.3.0
openrisc              randconfig-2002-20261119    gcc-16.2.0
openrisc              randconfig-2200-20261119    gcc-16.2.0 smatch
openrisc             randconfig-r2106-20261119    clang-24   cocci
openrisc             randconfig-r2107-20261118    gcc-8.5.0  cocci
openrisc             randconfig-r2109-20261119    gcc-10.5.0 cocci
openrisc             randconfig-r2300-20261119    gcc-8.5.0  sparse
openrisc             randconfig-r2302-20261118    gcc-8.5.0  sparse
openrisc             randconfig-r2307-20261119    gcc-11.5.0 sparse
openrisc             randconfig-r2308-20261119    gcc-11.5.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-64bit_defconfig    clang-17
parisc                randconfig-1000-20261121    gcc-10.5.0
parisc                randconfig-1001-20261121    gcc-10.5.0
parisc                randconfig-2000-20261118    gcc-11.5.0
parisc                randconfig-2000-20261119    gcc-8.5.0
parisc                randconfig-2001-20261118    gcc-11.5.0
parisc                randconfig-2001-20261119    gcc-8.5.0
parisc                randconfig-2200-20261118    gcc-11.5.0 smatch
parisc                randconfig-2200-20261119    gcc-14.4.0 smatch
parisc               randconfig-r2105-20261119    clang-19   cocci
parisc               randconfig-r2108-20261119    gcc-10.5.0 cocci
parisc               randconfig-r2110-20261119    gcc-12.5.0 cocci
parisc               randconfig-r2111-20261119    gcc-10.5.0 cocci
parisc               randconfig-r2307-20261118    gcc-14.4.0 sparse
parisc               randconfig-r2309-20261119    gcc-10.5.0 sparse
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc               randconfig-1000-20261121    gcc-10.5.0
powerpc               randconfig-1001-20261121    gcc-10.5.0
powerpc               randconfig-2000-20261118    clang-21
powerpc               randconfig-2000-20261119    gcc-15.3.0
powerpc               randconfig-2001-20261118    clang-21
powerpc               randconfig-2001-20261119    gcc-15.3.0
powerpc               randconfig-2002-20261118    clang-21
powerpc               randconfig-2002-20261119    gcc-15.3.0
powerpc               randconfig-2200-20261118    clang-24   smatch
powerpc               randconfig-2200-20261119    gcc-13.5.0 smatch
powerpc              randconfig-r2100-20261119    clang-19   cocci
powerpc              randconfig-r2109-20261119    gcc-14     cocci
powerpc              randconfig-r2301-20261119    gcc-11.5.0 sparse
powerpc              randconfig-r2303-20261119    gcc-16.2.0 sparse
powerpc              randconfig-r2307-20261119    gcc-14.4.0 sparse
powerpc              randconfig-r2310-20261119    gcc-14     sparse
powerpc64             randconfig-1000-20261121    gcc-10.5.0
powerpc64             randconfig-1001-20261121    gcc-10.5.0
powerpc64             randconfig-2000-20261118    clang-21
powerpc64             randconfig-2000-20261119    gcc-15.3.0
powerpc64             randconfig-2001-20261118    clang-21
powerpc64             randconfig-2001-20261119    gcc-15.3.0
powerpc64             randconfig-2002-20261118    clang-21
powerpc64             randconfig-2002-20261119    gcc-15.3.0
powerpc64             randconfig-2200-20261118    clang-24   smatch
powerpc64             randconfig-2200-20261119    clang-24   smatch
powerpc64            randconfig-r2100-20261119    gcc-8.5.0  cocci
powerpc64            randconfig-r2101-20261119    gcc-16.2.0 cocci
powerpc64            randconfig-r2104-20261119    gcc-9.5.0  cocci
powerpc64            randconfig-r2305-20261119    gcc-8.5.0  sparse
powerpc64            randconfig-r2306-20261119    gcc-14.4.0 sparse
powerpc64            randconfig-r2308-20261119    gcc-10.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261120    gcc-11.5.0
riscv                 randconfig-1001-20261120    gcc-11.5.0
riscv                 randconfig-2000-20261118    gcc-8.5.0
riscv                 randconfig-2000-20261119    clang-24
riscv                 randconfig-2001-20261118    gcc-8.5.0
riscv                 randconfig-2001-20261119    clang-24
riscv                 randconfig-2002-20261118    gcc-8.5.0
riscv                 randconfig-2002-20261119    clang-24
riscv                 randconfig-2003-20261118    gcc-8.5.0
riscv                 randconfig-2003-20261119    clang-24
riscv                 randconfig-2004-20261118    gcc-8.5.0
riscv                 randconfig-2004-20261119    clang-24
riscv                 randconfig-2005-20261118    gcc-8.5.0
riscv                 randconfig-2005-20261119    clang-24
riscv                 randconfig-2200-20261118    clang-24   smatch
riscv                 randconfig-2200-20261119    clang-24   smatch
riscv                randconfig-r2100-20261118    clang-17   cocci
riscv                randconfig-r2101-20261119    clang-24   cocci
riscv                randconfig-r2103-20261119    clang-24   cocci
riscv                randconfig-r2105-20261118    clang-17   cocci
riscv                randconfig-r2106-20261119    gcc-12.5.0 cocci
riscv                randconfig-r2111-20261119    gcc-14     cocci
riscv                randconfig-r2302-20261119    clang-24   sparse
riscv                randconfig-r2306-20261119    gcc-11.5.0 sparse
riscv                randconfig-r2309-20261119    gcc-14     sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261120    gcc-11.5.0
s390                  randconfig-1001-20261120    gcc-11.5.0
s390                  randconfig-2000-20261118    clang-24
s390                  randconfig-2000-20261119    clang-20
s390                  randconfig-2001-20261118    clang-24
s390                  randconfig-2001-20261119    clang-20
s390                  randconfig-2002-20261118    clang-24
s390                  randconfig-2002-20261119    clang-20
s390                  randconfig-2003-20261118    clang-24
s390                  randconfig-2003-20261119    clang-20
s390                  randconfig-2004-20261118    clang-24
s390                  randconfig-2004-20261119    clang-20
s390                  randconfig-2005-20261118    clang-24
s390                  randconfig-2005-20261119    clang-20
s390                  randconfig-2200-20261118    gcc-8.5.0  smatch
s390                  randconfig-2200-20261119    clang-24   smatch
s390                 randconfig-r2102-20261118    clang-17   cocci
s390                 randconfig-r2103-20261119    clang-19   cocci
s390                 randconfig-r2103-20261119    gcc-9.5.0  cocci
s390                 randconfig-r2110-20261119    gcc-12.5.0 cocci
s390                 randconfig-r2111-20261119    clang-24   cocci
s390                 randconfig-r2303-20261119    clang-24   sparse
s390                 randconfig-r2304-20261119    clang-24   sparse
s390                 randconfig-r2304-20261119    gcc-11.5.0 sparse
s390                 randconfig-r2308-20261119    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           r7785rp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261120    gcc-11.5.0
sh                    randconfig-1001-20261120    gcc-11.5.0
sh                    randconfig-2000-20261118    gcc-9.5.0
sh                    randconfig-2000-20261119    gcc-12.5.0
sh                    randconfig-2001-20261118    gcc-9.5.0
sh                    randconfig-2001-20261119    gcc-12.5.0
sh                    randconfig-2002-20261118    gcc-9.5.0
sh                    randconfig-2002-20261119    gcc-12.5.0
sh                    randconfig-2003-20261118    gcc-9.5.0
sh                    randconfig-2003-20261119    gcc-12.5.0
sh                    randconfig-2004-20261118    gcc-9.5.0
sh                    randconfig-2004-20261119    gcc-12.5.0
sh                    randconfig-2005-20261118    gcc-9.5.0
sh                    randconfig-2005-20261119    gcc-12.5.0
sh                    randconfig-2200-20261118    gcc-13.5.0 smatch
sh                    randconfig-2200-20261119    gcc-16.2.0 smatch
sh                   randconfig-r2108-20261119    gcc-12.5.0 cocci
sh                   randconfig-r2302-20261119    gcc-13.5.0 sparse
sh                   randconfig-r2304-20261119    clang-24   sparse
sh                   randconfig-r2305-20261119    gcc-15.3.0 sparse
sh                   randconfig-r2309-20261119    gcc-11.5.0 sparse
sh                   randconfig-r2310-20261119    clang-24   sparse
sh                            se7780_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261120    clang-24
sparc                 randconfig-1001-20261120    clang-24
sparc                 randconfig-2000-20261118    clang-24
sparc                 randconfig-2000-20261119    clang-21
sparc                 randconfig-2001-20261118    clang-24
sparc                 randconfig-2001-20261119    clang-21
sparc                 randconfig-2200-20261118    gcc-13.5.0 smatch
sparc                 randconfig-2200-20261119    gcc-8.5.0  smatch
sparc                randconfig-r2100-20261119    clang-24   cocci
sparc                randconfig-r2105-20261119    clang-24   cocci
sparc                randconfig-r2301-20261119    clang-24   sparse
sparc                randconfig-r2304-20261119    gcc-8.5.0  sparse
sparc                randconfig-r2308-20261119    gcc-11.5.0 sparse
sparc                randconfig-r2309-20261119    gcc-14.4.0 sparse
sparc                randconfig-r2311-20261118    gcc-14.4.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261120    clang-24
sparc64               randconfig-1001-20261120    clang-24
sparc64               randconfig-2000-20261118    clang-24
sparc64               randconfig-2000-20261119    clang-21
sparc64               randconfig-2001-20261118    clang-24
sparc64               randconfig-2001-20261119    clang-21
sparc64               randconfig-2200-20261118    clang-22   smatch
sparc64               randconfig-2200-20261119    gcc-13.5.0 smatch
sparc64              randconfig-r2107-20261119    gcc-10.5.0 cocci
sparc64              randconfig-r2109-20261119    clang-24   cocci
sparc64              randconfig-r2300-20261119    gcc-13.5.0 sparse
sparc64              randconfig-r2307-20261119    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261120    clang-24
um                    randconfig-1001-20261120    clang-24
um                    randconfig-2000-20261118    clang-24
um                    randconfig-2000-20261119    clang-21
um                    randconfig-2001-20261118    clang-24
um                    randconfig-2001-20261119    clang-21
um                    randconfig-2200-20261118    clang-24   smatch
um                   randconfig-r2107-20261119    gcc-14     cocci
um                   randconfig-r2108-20261119    gcc-14     cocci
um                   randconfig-r2109-20261118    gcc-8.5.0  cocci
um                   randconfig-r2110-20261119    clang-24   cocci
um                   randconfig-r2301-20261119    gcc-15.3.0 sparse
um                   randconfig-r2301-20261119    gcc-8.5.0  sparse
um                   randconfig-r2310-20261118    gcc-14.4.0 sparse
um                   randconfig-r2311-20261119    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261120    clang-22
x86_64      buildonly-randconfig-1001-20261120    clang-22
x86_64      buildonly-randconfig-1002-20261120    clang-22
x86_64      buildonly-randconfig-1003-20261120    clang-22
x86_64      buildonly-randconfig-1004-20261120    clang-22
x86_64      buildonly-randconfig-1005-20261120    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261120    clang-22
x86_64                randconfig-1001-20261120    clang-22
x86_64                randconfig-1002-20261120    clang-22
x86_64                randconfig-1003-20261120    clang-22
x86_64                randconfig-1004-20261120    clang-22
x86_64                randconfig-1005-20261120    clang-22
x86_64                randconfig-1006-20261120    clang-22
x86_64                randconfig-1007-20261120    clang-22
x86_64                randconfig-1008-20261120    clang-22
x86_64                randconfig-1009-20261120    clang-22
x86_64                randconfig-1010-20261120    clang-22
x86_64                randconfig-1011-20261120    clang-22
x86_64                randconfig-2000-20261118    gcc-13
x86_64                randconfig-2000-20261119    clang-22
x86_64                randconfig-2001-20261118    gcc-13
x86_64                randconfig-2001-20261119    clang-22
x86_64                randconfig-2002-20261118    gcc-13
x86_64                randconfig-2002-20261119    clang-22
x86_64                randconfig-2003-20261118    gcc-13
x86_64                randconfig-2003-20261119    clang-22
x86_64                randconfig-2004-20261118    gcc-13
x86_64                randconfig-2004-20261119    clang-22
x86_64                randconfig-2005-20261118    gcc-13
x86_64                randconfig-2005-20261119    clang-22
x86_64                randconfig-2100-20261118    clang-22   cocci
x86_64                randconfig-2100-20261119    clang-22   cocci
x86_64                randconfig-2101-20261118    clang-22   cocci
x86_64                randconfig-2101-20261119    clang-22   cocci
x86_64                randconfig-2102-20261118    clang-22   cocci
x86_64                randconfig-2102-20261119    clang-22   cocci
x86_64                randconfig-2103-20261118    clang-22   cocci
x86_64                randconfig-2103-20261119    clang-22   cocci
x86_64                randconfig-2104-20261118    clang-22   cocci
x86_64                randconfig-2104-20261119    clang-22   cocci
x86_64                randconfig-2105-20261118    clang-22   cocci
x86_64                randconfig-2105-20261119    clang-22   cocci
x86_64                randconfig-2200-20261118    clang-22   smatch
x86_64                randconfig-2200-20261119    clang-22   smatch
x86_64                randconfig-2300-20261118    gcc-14     sparse
x86_64                randconfig-2300-20261119    gcc-14     sparse
x86_64                randconfig-2301-20261118    gcc-14     sparse
x86_64                randconfig-2301-20261119    gcc-14     sparse
x86_64                randconfig-2302-20261118    gcc-14     sparse
x86_64                randconfig-2302-20261119    gcc-14     sparse
x86_64               randconfig-r2102-20261119    clang-24   cocci
x86_64               randconfig-r2105-20261119    gcc-11.5.0 cocci
x86_64               randconfig-r2108-20261119    gcc-12.5.0 cocci
x86_64               randconfig-r2109-20261119    gcc-12.5.0 cocci
x86_64               randconfig-r2111-20261119    gcc-14     cocci
x86_64               randconfig-r2303-20261119    clang-24   sparse
x86_64               randconfig-r2304-20261119    gcc-13.5.0 sparse
x86_64               randconfig-r2307-20261119    gcc-14     sparse
x86_64               randconfig-r2311-20261119    gcc-10.5.0 sparse
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
xtensa                randconfig-1000-20261120    clang-24
xtensa                randconfig-1001-20261120    clang-24
xtensa                randconfig-2000-20261118    gcc-16.2.0
xtensa                randconfig-2000-20261119    gcc-16.2.0
xtensa                randconfig-2001-20261118    gcc-16.2.0
xtensa                randconfig-2001-20261119    gcc-16.2.0
xtensa                randconfig-2200-20261119    gcc-14.4.0 smatch
xtensa               randconfig-r2107-20261119    gcc-12.5.0 cocci
xtensa               randconfig-r2111-20261118    gcc-8.5.0  cocci
xtensa               randconfig-r2302-20261119    gcc-11.5.0 sparse
xtensa               randconfig-r2310-20261119    gcc-10.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
