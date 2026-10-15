Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8645D470117
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 06:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046497; cv=none; b=QCvT1Z3ndr6hReJfHPEkczMqny+ZF5ch5DqC8B2bEFZ4P0oPfNxQ8lkZ0JW9/rELK69zRwJHYdvGPciICjMX8ulpKd5u3tzpLTc1Bf1geRK9BJDQAlKeb4GvdBrrPnvuGNJKKtEAPWPWRY914RTDWRcVY6mQXIa1GpWTnm6MacA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046497; c=relaxed/simple;
	bh=74ZRr0WUzjiQF7JGry8dvstdDkXHRUt6B3yfid1/T6Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KXRg7ic5AfKbcl35dkqlFEjgP+9KL4OiDAhrDhE/KX8M0OAKiljPspTF6D1fMupT1gR5DoMR3Y7+AbZRkRyoo7MVoPWgZA+a0R8DddoNm7CdPb2255R0F37sY+o4MXbscCL2RG06++r6Awu0JklR7ioaVxIwkfPslFUEJXaNlFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSt9EThl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSt9EThl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792046494; x=1823582494;
  h=date:from:to:cc:subject:message-id;
  bh=74ZRr0WUzjiQF7JGry8dvstdDkXHRUt6B3yfid1/T6Y=;
  b=nSt9EThlCnOpsASNMrpf8T176Xgde0zHMZyVjWjO480MEMvdfNgM1cbk
   Oyvq0OHH1JHGBD3eVjxM2ndwGtD1S2A6OEF3k9qxwU/H7ePfaVDOdTuZ/
   RJDRxj/EZVjuRSSx8ZH9EczHqS7LrcXCebZJjTt5VT+X+wFQEi5iFCv2q
   ScmtDqEkqU7+dFblzU5ieN5q4rhvP2r7IfymajpMmr5wrWw/cdmd2NqVY
   dxPBUB6i69NZrXsYEgktYh17UmAEXjTt8Xn/J8ilsaOooc8djDyEZxbEG
   I9kjcfwKJopEeqkk3zT7ytfE2VEmh71xz5eN7w3bK7vMvBq/pEReFE6WE
   A==;
X-CSE-ConnectionGUID: 3fk3EfeZTHq4Fi3+4Yi+Ag==
X-CSE-MsgGUID: 6acLp5dzQaqNmv8x2M49XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="693802"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="693802"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 23:41:32 -0700
X-CSE-ConnectionGUID: L4D8q4A6QxWoqGUONqiQEw==
X-CSE-MsgGUID: gFdiuCCySXuv/GxCNyULjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1861697"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Oct 2026 23:41:32 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHF9c-00000000Fxg-3uuM;
	Thu, 15 Oct 2026 06:41:28 +0000
Date: Thu, 15 Oct 2026 14:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 1fa1cb68aef8bb5c8bbf89f960fac583c34f5b68
Message-ID: <202610151433.bkTTe7Sp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 1fa1cb68aef8bb5c8bbf89f960fac583c34f5b68  Merge tag 'v7.3-rc7' into renesas-devel

elapsed time: 2249m

configs tested: 738
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261014    gcc-8.5.0  cocci
alpha                randconfig-r2102-20261014    gcc-12.5.0 cocci
alpha                randconfig-r2104-20261013    clang-22   cocci
alpha                randconfig-r2105-20261013    gcc-8.5.0  cocci
alpha                randconfig-r2105-20261014    gcc-10.5.0 cocci
alpha                randconfig-r2106-20261013    clang-22   cocci
alpha                randconfig-r2109-20261014    gcc-13.4.0 cocci
alpha                randconfig-r2110-20261012    gcc-10.5.0 cocci
alpha                randconfig-r2308-20261014    gcc-14.3.0 sparse
alpha                randconfig-r2309-20261012    gcc-12.5.0 sparse
alpha                randconfig-r2309-20261013    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-2000-20261012    gcc-16.1.0
arc                   randconfig-2000-20261013    gcc-8.5.0
arc                   randconfig-2000-20261014    gcc-10.5.0
arc                   randconfig-2001-20261012    gcc-16.1.0
arc                   randconfig-2001-20261013    gcc-8.5.0
arc                   randconfig-2001-20261014    gcc-10.5.0
arc                  randconfig-r2102-20261013    clang-24   cocci
arc                  randconfig-r2102-20261014    gcc-8.5.0  cocci
arc                  randconfig-r2107-20261013    clang-22   cocci
arc                  randconfig-r2109-20261013    clang-24   cocci
arc                  randconfig-r2110-20261013    gcc-8.5.0  cocci
arc                  randconfig-r2200-20261012    gcc-16.1.0 smatch
arc                  randconfig-r2200-20261013    gcc-13.4.0 smatch
arc                  randconfig-r2300-20261013    gcc-8.5.0  sparse
arc                  randconfig-r2301-20261012    gcc-11.5.0 sparse
arc                  randconfig-r2301-20261013    gcc-12.5.0 sparse
arc                  randconfig-r2306-20261014    gcc-8.5.0  sparse
arc                  randconfig-r2307-20261014    gcc-8.5.0  sparse
arc                  randconfig-r2308-20261014    gcc-16.1.0 sparse
arc                  randconfig-r2310-20261012    gcc-12.5.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    gcc-16.1.0
arm                      davinci_all_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                       jornada720_defconfig    clang-24
arm                          mv78xx0_defconfig    gcc-16.1.0
arm                              mxs_defconfig    gcc-16.1.0
arm                   randconfig-2000-20261012    gcc-16.1.0
arm                   randconfig-2000-20261013    gcc-8.5.0
arm                   randconfig-2000-20261014    gcc-10.5.0
arm                   randconfig-2001-20261012    gcc-16.1.0
arm                   randconfig-2001-20261013    gcc-8.5.0
arm                   randconfig-2001-20261014    gcc-10.5.0
arm                  randconfig-r2101-20261013    clang-24   cocci
arm                  randconfig-r2104-20261013    gcc-8.5.0  cocci
arm                  randconfig-r2107-20261012    gcc-11.5.0 cocci
arm                  randconfig-r2107-20261012    gcc-9.5.0  cocci
arm                  randconfig-r2109-20261013    clang-24   cocci
arm                  randconfig-r2110-20261012    clang-24   cocci
arm                  randconfig-r2111-20261013    gcc-14.3.0 cocci
arm                  randconfig-r2201-20261012    gcc-10.5.0 smatch
arm                  randconfig-r2202-20261013    gcc-8.5.0  smatch
arm                  randconfig-r2306-20261012    gcc-12.5.0 sparse
arm                  randconfig-r2307-20261013    clang-19   sparse
arm                  randconfig-r2308-20261013    clang-24   sparse
arm                  randconfig-r2311-20261012    gcc-12.5.0 sparse
arm                  randconfig-r2311-20261013    gcc-13.4.0 sparse
arm                          s3c6400_defconfig    clang-24
arm                          socfpga_defconfig    gcc-16.1.0
arm                            u8500_defconfig    clang-24
arm                         vexpress_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261015    gcc-8.5.0
arm64                 randconfig-1001-20261015    gcc-8.5.0
arm64                 randconfig-1002-20261015    gcc-8.5.0
arm64                 randconfig-1003-20261015    gcc-8.5.0
arm64                 randconfig-2000-20261012    gcc-16.1.0
arm64                 randconfig-2000-20261013    gcc-9.5.0
arm64                 randconfig-2000-20261014    gcc-16.1.0
arm64                 randconfig-2001-20261012    gcc-16.1.0
arm64                 randconfig-2001-20261013    gcc-9.5.0
arm64                 randconfig-2001-20261014    gcc-16.1.0
arm64                randconfig-r2100-20261014    gcc-13.4.0 cocci
arm64                randconfig-r2101-20261012    gcc-15.2.0 cocci
arm64                randconfig-r2101-20261014    gcc-11.5.0 cocci
arm64                randconfig-r2103-20261013    clang-24   cocci
arm64                randconfig-r2104-20261014    gcc-10.5.0 cocci
arm64                randconfig-r2105-20261014    gcc-8.5.0  cocci
arm64                randconfig-r2108-20261012    gcc-15.2.0 cocci
arm64                randconfig-r2111-20261012    gcc-11.5.0 cocci
arm64                randconfig-r2200-20261013    gcc-8.5.0  smatch
arm64                randconfig-r2201-20261012    gcc-10.5.0 smatch
arm64                randconfig-r2201-20261013    gcc-11.5.0 smatch
arm64                randconfig-r2201-20261014    clang-24   smatch
arm64                randconfig-r2303-20261012    clang-24   sparse
arm64                randconfig-r2305-20261012    clang-24   sparse
arm64                randconfig-r2305-20261013    gcc-12.5.0 sparse
arm64                randconfig-r2305-20261014    clang-24   sparse
arm64                randconfig-r2306-20261013    gcc-10.5.0 sparse
arm64                randconfig-r2307-20261012    gcc-16.1.0 sparse
arm64                randconfig-r2309-20261013    clang-19   sparse
arm64                randconfig-r2311-20261012    gcc-12.5.0 sparse
arm64                randconfig-r2311-20261013    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261015    gcc-8.5.0
csky                  randconfig-1001-20261015    gcc-8.5.0
csky                  randconfig-2000-20261012    gcc-16.1.0
csky                  randconfig-2000-20261013    gcc-9.5.0
csky                  randconfig-2000-20261014    gcc-16.1.0
csky                  randconfig-2001-20261012    gcc-16.1.0
csky                  randconfig-2001-20261013    gcc-9.5.0
csky                  randconfig-2001-20261014    gcc-16.1.0
csky                 randconfig-r2100-20261012    gcc-12.5.0 cocci
csky                 randconfig-r2100-20261014    gcc-12.5.0 cocci
csky                 randconfig-r2101-20261013    gcc-12.5.0 cocci
csky                 randconfig-r2106-20261012    gcc-14     cocci
csky                 randconfig-r2106-20261014    gcc-10.5.0 cocci
csky                 randconfig-r2108-20261014    gcc-13.4.0 cocci
csky                 randconfig-r2111-20261012    gcc-10.5.0 cocci
csky                 randconfig-r2111-20261013    gcc-10.5.0 cocci
csky                 randconfig-r2200-20261012    gcc-10.5.0 smatch
csky                 randconfig-r2201-20261014    gcc-14.3.0 smatch
csky                 randconfig-r2300-20261013    gcc-16.1.0 sparse
csky                 randconfig-r2302-20261012    clang-24   sparse
csky                 randconfig-r2302-20261014    clang-24   sparse
csky                 randconfig-r2303-20261013    gcc-16.1.0 sparse
csky                 randconfig-r2303-20261014    clang-24   sparse
csky                 randconfig-r2304-20261013    gcc-16.1.0 sparse
csky                 randconfig-r2306-20261012    gcc-12.5.0 sparse
csky                 randconfig-r2309-20261014    gcc-14.3.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261015    clang-24
hexagon               randconfig-1001-20261015    clang-24
hexagon               randconfig-2000-20261012    gcc-16.1.0
hexagon               randconfig-2000-20261013    gcc-9.5.0
hexagon               randconfig-2000-20261014    gcc-16.1.0
hexagon               randconfig-2001-20261012    gcc-16.1.0
hexagon               randconfig-2001-20261013    gcc-9.5.0
hexagon               randconfig-2001-20261014    gcc-16.1.0
hexagon              randconfig-r2101-20261013    clang-24   cocci
hexagon              randconfig-r2102-20261012    clang-24   cocci
hexagon              randconfig-r2102-20261013    clang-24   cocci
hexagon              randconfig-r2103-20261013    clang-21   cocci
hexagon              randconfig-r2103-20261013    clang-24   cocci
hexagon              randconfig-r2103-20261014    gcc-11.5.0 cocci
hexagon              randconfig-r2104-20261012    clang-24   cocci
hexagon              randconfig-r2104-20261014    gcc-10.5.0 cocci
hexagon              randconfig-r2107-20261013    clang-24   cocci
hexagon              randconfig-r2107-20261014    gcc-10.5.0 cocci
hexagon              randconfig-r2109-20261012    clang-24   cocci
hexagon              randconfig-r2110-20261012    gcc-14     cocci
hexagon              randconfig-r2301-20261013    gcc-8.5.0  sparse
hexagon              randconfig-r2304-20261014    clang-24   sparse
hexagon              randconfig-r2305-20261012    clang-24   sparse
hexagon              randconfig-r2305-20261014    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261015    gcc-14
i386        buildonly-randconfig-1001-20261015    gcc-14
i386        buildonly-randconfig-1002-20261015    gcc-14
i386        buildonly-randconfig-1003-20261015    gcc-14
i386        buildonly-randconfig-1004-20261015    gcc-14
i386        buildonly-randconfig-1005-20261015    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261015    gcc-14
i386                  randconfig-1001-20261015    gcc-14
i386                  randconfig-1002-20261015    gcc-14
i386                  randconfig-1003-20261015    gcc-14
i386                  randconfig-1004-20261015    gcc-14
i386                  randconfig-1005-20261015    gcc-14
i386                  randconfig-1006-20261015    gcc-14
i386                  randconfig-1007-20261015    clang-22
i386                  randconfig-1008-20261015    clang-22
i386                  randconfig-1009-20261015    clang-22
i386                  randconfig-1010-20261015    clang-22
i386                  randconfig-1011-20261015    clang-22
i386                  randconfig-1012-20261015    clang-22
i386                  randconfig-1013-20261015    clang-22
i386                  randconfig-2000-20261012    gcc-16.1.0
i386                  randconfig-2000-20261013    gcc-8.5.0
i386                  randconfig-2000-20261014    gcc-10.5.0
i386                  randconfig-2001-20261012    gcc-16.1.0
i386                  randconfig-2001-20261013    gcc-8.5.0
i386                  randconfig-2001-20261014    gcc-10.5.0
i386                  randconfig-2100-20261012    clang-22   cocci
i386                  randconfig-2100-20261013    gcc-14     cocci
i386                  randconfig-2100-20261014    gcc-13     cocci
i386                  randconfig-2101-20261012    clang-22   cocci
i386                  randconfig-2101-20261013    gcc-14     cocci
i386                  randconfig-2101-20261014    gcc-13     cocci
i386                  randconfig-2102-20261012    clang-22   cocci
i386                  randconfig-2102-20261013    gcc-14     cocci
i386                  randconfig-2102-20261014    gcc-13     cocci
i386                  randconfig-2103-20261012    clang-22   cocci
i386                  randconfig-2103-20261013    gcc-14     cocci
i386                  randconfig-2103-20261014    gcc-13     cocci
i386                  randconfig-2104-20261012    clang-22   cocci
i386                  randconfig-2104-20261013    gcc-14     cocci
i386                  randconfig-2104-20261014    gcc-13     cocci
i386                  randconfig-2105-20261012    clang-22   cocci
i386                  randconfig-2105-20261013    gcc-14     cocci
i386                  randconfig-2105-20261014    gcc-13     cocci
i386                  randconfig-2200-20261012    clang-22   smatch
i386                  randconfig-2200-20261013    gcc-14     smatch
i386                  randconfig-2200-20261014    clang-22   smatch
i386                  randconfig-2300-20261012    gcc-14     sparse
i386                  randconfig-2300-20261013    gcc-14     sparse
i386                  randconfig-2300-20261014    clang-22   sparse
i386                  randconfig-2301-20261012    gcc-14     sparse
i386                  randconfig-2301-20261013    gcc-14     sparse
i386                  randconfig-2301-20261014    clang-22   sparse
i386                  randconfig-2302-20261012    gcc-14     sparse
i386                  randconfig-2302-20261013    gcc-14     sparse
i386                  randconfig-2302-20261014    clang-22   sparse
i386                 randconfig-r2100-20261012    clang-24   cocci
i386                 randconfig-r2100-20261013    clang-24   cocci
i386                 randconfig-r2102-20261013    clang-24   cocci
i386                 randconfig-r2104-20261013    gcc-10.5.0 cocci
i386                 randconfig-r2110-20261013    clang-24   cocci
i386                 randconfig-r2110-20261014    gcc-10.5.0 cocci
i386                 randconfig-r2111-20261013    clang-22   cocci
i386                 randconfig-r2111-20261014    gcc-8.5.0  cocci
i386                 randconfig-r2202-20261012    clang-22   smatch
i386                 randconfig-r2300-20261014    clang-24   sparse
i386                 randconfig-r2300-20261014    gcc-13.4.0 sparse
i386                 randconfig-r2301-20261012    clang-22   sparse
i386                 randconfig-r2305-20261013    clang-22   sparse
i386                 randconfig-r2305-20261014    gcc-8.5.0  sparse
i386                 randconfig-r2307-20261012    gcc-12.5.0 sparse
i386                 randconfig-r2308-20261012    gcc-16.1.0 sparse
i386                 randconfig-r2308-20261013    gcc-9.5.0  sparse
i386                 randconfig-r2310-20261012    gcc-12.5.0 sparse
i386                 randconfig-r2311-20261012    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    clang-24
loongarch             randconfig-1000-20261015    clang-24
loongarch             randconfig-1001-20261015    clang-24
loongarch             randconfig-2000-20261012    gcc-11.5.0
loongarch             randconfig-2000-20261013    gcc-11.5.0
loongarch             randconfig-2000-20261014    gcc-8.5.0
loongarch             randconfig-2001-20261012    gcc-11.5.0
loongarch             randconfig-2001-20261013    gcc-11.5.0
loongarch             randconfig-2001-20261014    gcc-8.5.0
loongarch            randconfig-r2100-20261013    gcc-12.5.0 cocci
loongarch            randconfig-r2101-20261012    clang-24   cocci
loongarch            randconfig-r2101-20261013    clang-24   cocci
loongarch            randconfig-r2102-20261012    gcc-12.5.0 cocci
loongarch            randconfig-r2104-20261014    gcc-8.5.0  cocci
loongarch            randconfig-r2106-20261012    gcc-10.5.0 cocci
loongarch            randconfig-r2106-20261013    gcc-8.5.0  cocci
loongarch            randconfig-r2110-20261012    gcc-11.5.0 cocci
loongarch            randconfig-r2110-20261013    gcc-14.3.0 cocci
loongarch            randconfig-r2111-20261014    gcc-10.5.0 cocci
loongarch            randconfig-r2201-20261012    clang-20   smatch
loongarch            randconfig-r2201-20261013    clang-24   smatch
loongarch            randconfig-r2300-20261013    gcc-12.5.0 sparse
loongarch            randconfig-r2301-20261014    clang-24   sparse
loongarch            randconfig-r2302-20261012    clang-24   sparse
loongarch            randconfig-r2302-20261014    gcc-8.5.0  sparse
loongarch            randconfig-r2303-20261014    gcc-13.4.0 sparse
loongarch            randconfig-r2305-20261012    clang-22   sparse
loongarch            randconfig-r2305-20261014    clang-24   sparse
loongarch            randconfig-r2306-20261013    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2100-20261013    clang-24   cocci
m68k                 randconfig-r2101-20261012    clang-24   cocci
m68k                 randconfig-r2103-20261012    gcc-12.5.0 cocci
m68k                 randconfig-r2103-20261013    gcc-12.5.0 cocci
m68k                 randconfig-r2103-20261014    gcc-13.4.0 cocci
m68k                 randconfig-r2107-20261013    gcc-8.5.0  cocci
m68k                 randconfig-r2107-20261014    gcc-10.5.0 cocci
m68k                 randconfig-r2108-20261013    clang-24   cocci
m68k                 randconfig-r2108-20261014    gcc-12.5.0 cocci
m68k                 randconfig-r2109-20261012    gcc-12.5.0 cocci
m68k                 randconfig-r2109-20261013    gcc-12.5.0 cocci
m68k                 randconfig-r2200-20261014    gcc-9.5.0  smatch
m68k                 randconfig-r2201-20261012    gcc-13.4.0 smatch
m68k                 randconfig-r2201-20261013    gcc-16.1.0 smatch
m68k                 randconfig-r2302-20261012    clang-24   sparse
m68k                 randconfig-r2305-20261012    clang-24   sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2101-20261014    gcc-8.5.0  cocci
microblaze           randconfig-r2105-20261014    gcc-10.5.0 cocci
microblaze           randconfig-r2108-20261012    clang-24   cocci
microblaze           randconfig-r2108-20261012    gcc-13.4.0 cocci
microblaze           randconfig-r2109-20261012    gcc-15.2.0 cocci
microblaze           randconfig-r2200-20261012    gcc-15.2.0 smatch
microblaze           randconfig-r2300-20261012    clang-24   sparse
microblaze           randconfig-r2301-20261013    gcc-16.1.0 sparse
microblaze           randconfig-r2302-20261012    gcc-11.5.0 sparse
microblaze           randconfig-r2307-20261013    clang-24   sparse
microblaze           randconfig-r2308-20261012    gcc-12.5.0 sparse
microblaze           randconfig-r2309-20261012    gcc-16.1.0 sparse
microblaze           randconfig-r2310-20261014    gcc-14.3.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                 randconfig-r2100-20261012    clang-24   cocci
mips                 randconfig-r2101-20261014    gcc-13.4.0 cocci
mips                 randconfig-r2103-20261014    gcc-8.5.0  cocci
mips                 randconfig-r2105-20261013    gcc-10.5.0 cocci
mips                 randconfig-r2106-20261013    gcc-10.5.0 cocci
mips                 randconfig-r2110-20261013    gcc-10.5.0 cocci
mips                 randconfig-r2111-20261013    clang-24   cocci
mips                 randconfig-r2201-20261014    clang-24   smatch
mips                 randconfig-r2202-20261013    clang-24   smatch
mips                 randconfig-r2300-20261013    gcc-8.5.0  sparse
mips                 randconfig-r2301-20261013    gcc-8.5.0  sparse
mips                 randconfig-r2302-20261013    gcc-8.5.0  sparse
mips                 randconfig-r2302-20261014    clang-24   sparse
mips                 randconfig-r2303-20261014    gcc-8.5.0  sparse
mips                 randconfig-r2304-20261012    clang-24   sparse
mips                 randconfig-r2304-20261014    gcc-13.4.0 sparse
mips                 randconfig-r2307-20261014    gcc-14     sparse
mips                 randconfig-r2307-20261014    gcc-14.3.0 sparse
mips                 randconfig-r2310-20261013    gcc-10.5.0 sparse
mips                 randconfig-r2311-20261014    gcc-16.1.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261015    clang-24
nios2                 randconfig-1001-20261015    clang-24
nios2                 randconfig-2000-20261012    gcc-11.5.0
nios2                 randconfig-2000-20261013    gcc-11.5.0
nios2                 randconfig-2000-20261014    gcc-8.5.0
nios2                 randconfig-2001-20261012    gcc-11.5.0
nios2                 randconfig-2001-20261013    gcc-11.5.0
nios2                 randconfig-2001-20261014    gcc-8.5.0
nios2                randconfig-r2102-20261014    gcc-11.5.0 cocci
nios2                randconfig-r2103-20261012    clang-24   cocci
nios2                randconfig-r2105-20261012    gcc-11.5.0 cocci
nios2                randconfig-r2106-20261013    gcc-14.3.0 cocci
nios2                randconfig-r2107-20261012    gcc-10.5.0 cocci
nios2                randconfig-r2108-20261012    clang-24   cocci
nios2                randconfig-r2108-20261012    gcc-12.5.0 cocci
nios2                randconfig-r2111-20261013    gcc-8.5.0  cocci
nios2                randconfig-r2201-20261013    gcc-8.5.0  smatch
nios2                randconfig-r2202-20261013    gcc-11.5.0 smatch
nios2                randconfig-r2300-20261012    clang-24   sparse
nios2                randconfig-r2302-20261013    clang-22   sparse
nios2                randconfig-r2302-20261014    gcc-13.4.0 sparse
nios2                randconfig-r2304-20261014    clang-24   sparse
nios2                randconfig-r2305-20261013    gcc-8.5.0  sparse
nios2                randconfig-r2308-20261013    gcc-13.4.0 sparse
nios2                randconfig-r2311-20261012    gcc-16.1.0 sparse
nios2                randconfig-r2311-20261013    clang-19   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2100-20261013    clang-24   cocci
openrisc             randconfig-r2104-20261012    gcc-14     cocci
openrisc             randconfig-r2108-20261014    gcc-11.5.0 cocci
openrisc             randconfig-r2201-20261013    gcc-15.2.0 smatch
openrisc             randconfig-r2310-20261012    gcc-16.1.0 sparse
openrisc             randconfig-r2310-20261013    gcc-13.4.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261015    gcc-8.5.0
parisc                randconfig-1001-20261015    gcc-8.5.0
parisc                randconfig-2000-20261012    gcc-11.5.0
parisc                randconfig-2000-20261013    gcc-11.5.0
parisc                randconfig-2000-20261014    gcc-8.5.0
parisc                randconfig-2001-20261012    gcc-11.5.0
parisc                randconfig-2001-20261013    gcc-11.5.0
parisc                randconfig-2001-20261014    gcc-8.5.0
parisc               randconfig-r2105-20261012    gcc-9.5.0  cocci
parisc               randconfig-r2106-20261013    gcc-8.5.0  cocci
parisc               randconfig-r2106-20261014    gcc-10.5.0 cocci
parisc               randconfig-r2108-20261013    clang-24   cocci
parisc               randconfig-r2108-20261014    gcc-8.5.0  cocci
parisc               randconfig-r2110-20261012    gcc-9.5.0  cocci
parisc               randconfig-r2111-20261012    gcc-9.5.0  cocci
parisc               randconfig-r2201-20261012    gcc-16.1.0 smatch
parisc               randconfig-r2202-20261012    gcc-10.5.0 smatch
parisc               randconfig-r2202-20261014    gcc-12.5.0 smatch
parisc               randconfig-r2303-20261012    clang-22   sparse
parisc               randconfig-r2304-20261012    clang-22   sparse
parisc               randconfig-r2305-20261013    gcc-16.1.0 sparse
parisc               randconfig-r2311-20261013    gcc-10.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                         cell_defconfig    clang-24
powerpc               randconfig-1000-20261015    gcc-8.5.0
powerpc               randconfig-1001-20261015    gcc-8.5.0
powerpc               randconfig-2000-20261012    gcc-14
powerpc               randconfig-2000-20261013    gcc-14
powerpc               randconfig-2000-20261014    clang-22
powerpc               randconfig-2001-20261012    gcc-14
powerpc               randconfig-2001-20261013    gcc-14
powerpc               randconfig-2001-20261014    clang-22
powerpc              randconfig-r2103-20261012    clang-24   cocci
powerpc              randconfig-r2106-20261012    clang-24   cocci
powerpc              randconfig-r2106-20261012    gcc-9.5.0  cocci
powerpc              randconfig-r2107-20261013    gcc-10.5.0 cocci
powerpc              randconfig-r2107-20261014    gcc-8.5.0  cocci
powerpc              randconfig-r2110-20261013    clang-22   cocci
powerpc              randconfig-r2110-20261013    gcc-8.5.0  cocci
powerpc              randconfig-r2111-20261014    gcc-10.5.0 cocci
powerpc              randconfig-r2300-20261014    clang-24   sparse
powerpc              randconfig-r2302-20261013    gcc-16.1.0 sparse
powerpc              randconfig-r2303-20261012    clang-24   sparse
powerpc              randconfig-r2305-20261012    gcc-11.5.0 sparse
powerpc              randconfig-r2305-20261013    gcc-8.5.0  sparse
powerpc              randconfig-r2308-20261014    gcc-8.5.0  sparse
powerpc              randconfig-r2309-20261012    clang-22   sparse
powerpc              randconfig-r2309-20261014    gcc-16.1.0 sparse
powerpc              randconfig-r2310-20261014    gcc-8.5.0  sparse
powerpc                      tqm8540_defconfig    clang-24
powerpc64             randconfig-1000-20261015    gcc-8.5.0
powerpc64             randconfig-1001-20261015    gcc-8.5.0
powerpc64             randconfig-2000-20261012    gcc-14
powerpc64             randconfig-2000-20261013    gcc-14
powerpc64             randconfig-2000-20261014    clang-22
powerpc64             randconfig-2001-20261012    gcc-14
powerpc64             randconfig-2001-20261013    gcc-14
powerpc64             randconfig-2001-20261014    clang-22
powerpc64            randconfig-r2101-20261014    gcc-12.5.0 cocci
powerpc64            randconfig-r2105-20261012    clang-24   cocci
powerpc64            randconfig-r2106-20261013    clang-24   cocci
powerpc64            randconfig-r2109-20261012    gcc-13.4.0 cocci
powerpc64            randconfig-r2109-20261013    clang-21   cocci
powerpc64            randconfig-r2109-20261013    clang-24   cocci
powerpc64            randconfig-r2300-20261012    gcc-11.5.0 sparse
powerpc64            randconfig-r2300-20261013    clang-22   sparse
powerpc64            randconfig-r2301-20261014    clang-24   sparse
powerpc64            randconfig-r2302-20261012    clang-22   sparse
powerpc64            randconfig-r2304-20261012    gcc-11.5.0 sparse
powerpc64            randconfig-r2304-20261014    gcc-8.5.0  sparse
powerpc64            randconfig-r2306-20261014    gcc-14.3.0 sparse
powerpc64            randconfig-r2307-20261013    clang-24   sparse
powerpc64            randconfig-r2309-20261013    clang-24   sparse
powerpc64            randconfig-r2310-20261013    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261015    gcc-11.5.0
riscv                 randconfig-1001-20261015    gcc-11.5.0
riscv                 randconfig-2000-20261012    gcc-14.3.0
riscv                 randconfig-2000-20261013    gcc-15.2.0
riscv                 randconfig-2000-20261014    gcc-16.1.0
riscv                 randconfig-2001-20261012    gcc-14.3.0
riscv                 randconfig-2001-20261013    gcc-15.2.0
riscv                 randconfig-2001-20261014    gcc-16.1.0
riscv                randconfig-r2102-20261012    clang-24   cocci
riscv                randconfig-r2102-20261012    gcc-15.2.0 cocci
riscv                randconfig-r2103-20261012    gcc-15.2.0 cocci
riscv                randconfig-r2111-20261012    clang-24   cocci
riscv                randconfig-r2111-20261013    gcc-8.5.0  cocci
riscv                randconfig-r2202-20261012    clang-24   smatch
riscv                randconfig-r2300-20261012    clang-22   sparse
riscv                randconfig-r2307-20261013    gcc-13.4.0 sparse
riscv                randconfig-r2307-20261014    gcc-16.1.0 sparse
riscv                randconfig-r2308-20261012    gcc-16.1.0 sparse
riscv                randconfig-r2308-20261013    gcc-10.5.0 sparse
riscv                randconfig-r2310-20261013    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261015    gcc-11.5.0
s390                  randconfig-1001-20261015    gcc-11.5.0
s390                  randconfig-2000-20261012    gcc-14.3.0
s390                  randconfig-2000-20261013    gcc-15.2.0
s390                  randconfig-2000-20261014    gcc-16.1.0
s390                  randconfig-2001-20261012    gcc-14.3.0
s390                  randconfig-2001-20261013    gcc-15.2.0
s390                  randconfig-2001-20261014    gcc-16.1.0
s390                 randconfig-r2100-20261012    gcc-13.4.0 cocci
s390                 randconfig-r2100-20261013    clang-21   cocci
s390                 randconfig-r2104-20261012    gcc-11.5.0 cocci
s390                 randconfig-r2105-20261012    gcc-14     cocci
s390                 randconfig-r2105-20261013    gcc-14.3.0 cocci
s390                 randconfig-r2106-20261014    gcc-8.5.0  cocci
s390                 randconfig-r2108-20261013    gcc-12.5.0 cocci
s390                 randconfig-r2109-20261013    clang-24   cocci
s390                 randconfig-r2109-20261014    gcc-12.5.0 cocci
s390                 randconfig-r2111-20261012    gcc-14     cocci
s390                 randconfig-r2200-20261013    clang-24   smatch
s390                 randconfig-r2200-20261014    gcc-8.5.0  smatch
s390                 randconfig-r2202-20261012    gcc-14.3.0 smatch
s390                 randconfig-r2302-20261013    gcc-12.5.0 sparse
s390                 randconfig-r2304-20261012    clang-24   sparse
s390                 randconfig-r2304-20261013    gcc-8.5.0  sparse
s390                 randconfig-r2306-20261012    clang-22   sparse
s390                 randconfig-r2307-20261013    gcc-10.5.0 sparse
s390                 randconfig-r2309-20261012    gcc-12.5.0 sparse
s390                 randconfig-r2310-20261012    clang-22   sparse
s390                 randconfig-r2310-20261012    gcc-16.1.0 sparse
s390                 randconfig-r2310-20261014    gcc-16.1.0 sparse
s390                 randconfig-r2311-20261013    clang-24   sparse
s390                 randconfig-r2311-20261014    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          ap325rxa_defconfig    clang-24
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261015    gcc-11.5.0
sh                    randconfig-1001-20261015    gcc-11.5.0
sh                    randconfig-2000-20261012    gcc-14.3.0
sh                    randconfig-2000-20261013    gcc-15.2.0
sh                    randconfig-2000-20261014    gcc-16.1.0
sh                    randconfig-2001-20261012    gcc-14.3.0
sh                    randconfig-2001-20261013    gcc-15.2.0
sh                    randconfig-2001-20261014    gcc-16.1.0
sh                   randconfig-r2101-20261013    clang-24   cocci
sh                   randconfig-r2104-20261013    gcc-8.5.0  cocci
sh                   randconfig-r2105-20261013    gcc-8.5.0  cocci
sh                   randconfig-r2107-20261012    clang-24   cocci
sh                   randconfig-r2109-20261012    clang-24   cocci
sh                   randconfig-r2300-20261012    clang-24   sparse
sh                   randconfig-r2301-20261012    clang-24   sparse
sh                   randconfig-r2306-20261013    gcc-9.5.0  sparse
sh                   randconfig-r2307-20261012    gcc-16.1.0 sparse
sh                   randconfig-r2309-20261012    gcc-16.1.0 sparse
sh                   randconfig-r2309-20261013    gcc-9.5.0  sparse
sh                   randconfig-r2309-20261014    gcc-8.5.0  sparse
sh                   randconfig-r2311-20261014    gcc-14     sparse
sh                   randconfig-r2311-20261014    gcc-8.5.0  sparse
sh                         sh7763rdp_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261015    gcc-8.5.0
sparc                 randconfig-1001-20261015    gcc-8.5.0
sparc                 randconfig-2000-20261012    gcc-8.5.0
sparc                 randconfig-2000-20261013    gcc-16.1.0
sparc                 randconfig-2000-20261014    gcc-14.3.0
sparc                 randconfig-2001-20261012    gcc-8.5.0
sparc                 randconfig-2001-20261013    gcc-16.1.0
sparc                 randconfig-2001-20261014    gcc-14.3.0
sparc                randconfig-r2100-20261012    gcc-15.2.0 cocci
sparc                randconfig-r2101-20261012    gcc-12.5.0 cocci
sparc                randconfig-r2103-20261013    clang-24   cocci
sparc                randconfig-r2103-20261014    gcc-12.5.0 cocci
sparc                randconfig-r2107-20261013    gcc-8.5.0  cocci
sparc                randconfig-r2108-20261013    clang-24   cocci
sparc                randconfig-r2110-20261014    gcc-8.5.0  cocci
sparc                randconfig-r2300-20261014    gcc-8.5.0  sparse
sparc                randconfig-r2301-20261014    gcc-13.4.0 sparse
sparc                randconfig-r2303-20261013    gcc-8.5.0  sparse
sparc                randconfig-r2303-20261014    clang-24   sparse
sparc                randconfig-r2304-20261013    clang-22   sparse
sparc                randconfig-r2304-20261014    clang-24   sparse
sparc                randconfig-r2306-20261012    gcc-16.1.0 sparse
sparc                randconfig-r2306-20261013    clang-19   sparse
sparc                randconfig-r2306-20261013    gcc-13.4.0 sparse
sparc                randconfig-r2306-20261014    gcc-16.1.0 sparse
sparc                randconfig-r2309-20261014    gcc-14     sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261015    gcc-8.5.0
sparc64               randconfig-1001-20261015    gcc-8.5.0
sparc64               randconfig-2000-20261012    gcc-8.5.0
sparc64               randconfig-2000-20261013    gcc-16.1.0
sparc64               randconfig-2000-20261014    gcc-14.3.0
sparc64               randconfig-2001-20261012    gcc-8.5.0
sparc64               randconfig-2001-20261013    gcc-16.1.0
sparc64               randconfig-2001-20261014    gcc-14.3.0
sparc64              randconfig-r2100-20261013    clang-24   cocci
sparc64              randconfig-r2102-20261014    gcc-13.4.0 cocci
sparc64              randconfig-r2105-20261013    clang-24   cocci
sparc64              randconfig-r2200-20261012    clang-20   smatch
sparc64              randconfig-r2200-20261013    clang-24   smatch
sparc64              randconfig-r2202-20261014    clang-22   smatch
sparc64              randconfig-r2301-20261012    clang-24   sparse
sparc64              randconfig-r2301-20261014    gcc-8.5.0  sparse
sparc64              randconfig-r2303-20261012    gcc-11.5.0 sparse
sparc64              randconfig-r2303-20261013    clang-22   sparse
sparc64              randconfig-r2304-20261013    gcc-12.5.0 sparse
sparc64              randconfig-r2305-20261014    gcc-13.4.0 sparse
sparc64              randconfig-r2310-20261014    gcc-14     sparse
sparc64              randconfig-r2311-20261012    gcc-16.1.0 sparse
sparc64              randconfig-r2311-20261013    gcc-9.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261015    gcc-8.5.0
um                    randconfig-1001-20261015    gcc-8.5.0
um                    randconfig-2000-20261012    gcc-8.5.0
um                    randconfig-2000-20261013    gcc-16.1.0
um                    randconfig-2000-20261014    gcc-14.3.0
um                    randconfig-2001-20261012    gcc-8.5.0
um                    randconfig-2001-20261013    gcc-16.1.0
um                    randconfig-2001-20261014    gcc-14.3.0
um                   randconfig-r2101-20261013    clang-21   cocci
um                   randconfig-r2102-20261013    clang-24   cocci
um                   randconfig-r2102-20261013    gcc-12.5.0 cocci
um                   randconfig-r2103-20261012    gcc-13.4.0 cocci
um                   randconfig-r2104-20261013    clang-24   cocci
um                   randconfig-r2106-20261012    gcc-11.5.0 cocci
um                   randconfig-r2108-20261013    clang-21   cocci
um                   randconfig-r2109-20261014    gcc-8.5.0  cocci
um                   randconfig-r2200-20261013    clang-17   smatch
um                   randconfig-r2200-20261014    clang-17   smatch
um                   randconfig-r2202-20261012    clang-17   smatch
um                   randconfig-r2302-20261014    clang-24   sparse
um                   randconfig-r2303-20261013    gcc-12.5.0 sparse
um                   randconfig-r2307-20261012    clang-22   sparse
um                   randconfig-r2308-20261013    clang-19   sparse
um                   randconfig-r2308-20261014    gcc-14     sparse
um                   randconfig-r2310-20261013    clang-19   sparse
um                   randconfig-r2310-20261013    gcc-9.5.0  sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261015    gcc-14
x86_64      buildonly-randconfig-1001-20261015    gcc-14
x86_64      buildonly-randconfig-1002-20261015    gcc-14
x86_64      buildonly-randconfig-1003-20261015    gcc-14
x86_64      buildonly-randconfig-1004-20261015    gcc-14
x86_64      buildonly-randconfig-1005-20261015    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261015    gcc-14
x86_64                randconfig-1001-20261015    gcc-14
x86_64                randconfig-1002-20261015    gcc-14
x86_64                randconfig-1003-20261015    gcc-14
x86_64                randconfig-1004-20261015    gcc-14
x86_64                randconfig-1005-20261015    gcc-14
x86_64                randconfig-1006-20261015    gcc-14
x86_64                randconfig-1007-20261015    gcc-14
x86_64                randconfig-1008-20261015    gcc-14
x86_64                randconfig-1009-20261015    gcc-14
x86_64                randconfig-1010-20261015    gcc-14
x86_64                randconfig-1011-20261015    gcc-14
x86_64                randconfig-1012-20261015    gcc-13
x86_64                randconfig-1013-20261015    gcc-13
x86_64                randconfig-1014-20261015    gcc-13
x86_64                randconfig-1015-20261015    gcc-13
x86_64                randconfig-1016-20261015    gcc-13
x86_64                randconfig-1017-20261015    gcc-13
x86_64                randconfig-2000-20261012    gcc-14
x86_64                randconfig-2000-20261013    gcc-14
x86_64                randconfig-2000-20261014    clang-22
x86_64                randconfig-2001-20261012    gcc-14
x86_64                randconfig-2001-20261013    gcc-14
x86_64                randconfig-2001-20261014    clang-22
x86_64                randconfig-2100-20261012    clang-22   cocci
x86_64                randconfig-2100-20261013    clang-22   cocci
x86_64                randconfig-2100-20261014    clang-22   cocci
x86_64                randconfig-2101-20261012    clang-22   cocci
x86_64                randconfig-2101-20261012    gcc-14     cocci
x86_64                randconfig-2101-20261013    clang-22   cocci
x86_64                randconfig-2101-20261014    clang-22   cocci
x86_64                randconfig-2102-20261012    clang-22   cocci
x86_64                randconfig-2102-20261013    clang-22   cocci
x86_64                randconfig-2102-20261014    clang-22   cocci
x86_64                randconfig-2103-20261012    clang-22   cocci
x86_64                randconfig-2103-20261013    clang-22   cocci
x86_64                randconfig-2103-20261014    clang-22   cocci
x86_64                randconfig-2104-20261012    clang-22   cocci
x86_64                randconfig-2104-20261013    clang-22   cocci
x86_64                randconfig-2104-20261014    clang-22   cocci
x86_64                randconfig-2105-20261012    clang-22   cocci
x86_64                randconfig-2105-20261013    clang-22   cocci
x86_64                randconfig-2105-20261014    clang-22   cocci
x86_64                randconfig-2200-20261012    gcc-14     smatch
x86_64                randconfig-2200-20261013    gcc-13     smatch
x86_64                randconfig-2200-20261014    clang-22   smatch
x86_64                randconfig-2300-20261012    gcc-14     sparse
x86_64                randconfig-2300-20261013    gcc-14     sparse
x86_64                randconfig-2300-20261014    clang-22   sparse
x86_64                randconfig-2301-20261012    gcc-14     sparse
x86_64                randconfig-2301-20261013    gcc-14     sparse
x86_64                randconfig-2301-20261014    clang-22   sparse
x86_64                randconfig-2302-20261012    gcc-14     sparse
x86_64                randconfig-2302-20261013    gcc-14     sparse
x86_64                randconfig-2302-20261014    clang-22   sparse
x86_64               randconfig-r2102-20261013    clang-21   cocci
x86_64               randconfig-r2104-20261012    gcc-10.5.0 cocci
x86_64               randconfig-r2105-20261012    gcc-10.5.0 cocci
x86_64               randconfig-r2107-20261012    gcc-14     cocci
x86_64               randconfig-r2109-20261014    gcc-11.5.0 cocci
x86_64               randconfig-r2202-20261013    gcc-14     smatch
x86_64               randconfig-r2202-20261014    clang-22   smatch
x86_64               randconfig-r2301-20261013    clang-22   sparse
x86_64               randconfig-r2302-20261013    gcc-8.5.0  sparse
x86_64               randconfig-r2303-20261013    gcc-8.5.0  sparse
x86_64               randconfig-r2304-20261012    clang-24   sparse
x86_64               randconfig-r2304-20261013    gcc-8.5.0  sparse
x86_64               randconfig-r2306-20261013    clang-24   sparse
x86_64               randconfig-r2306-20261014    gcc-14     sparse
x86_64               randconfig-r2308-20261012    clang-22   sparse
x86_64               randconfig-r2308-20261013    clang-24   sparse
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
xtensa                randconfig-1000-20261015    gcc-8.5.0
xtensa                randconfig-1001-20261015    gcc-8.5.0
xtensa                randconfig-2000-20261012    gcc-8.5.0
xtensa                randconfig-2000-20261013    gcc-16.1.0
xtensa                randconfig-2000-20261014    gcc-14.3.0
xtensa                randconfig-2001-20261012    gcc-8.5.0
xtensa                randconfig-2001-20261013    gcc-16.1.0
xtensa                randconfig-2001-20261014    gcc-14.3.0
xtensa               randconfig-r2100-20261014    gcc-11.5.0 cocci
xtensa               randconfig-r2101-20261012    gcc-13.4.0 cocci
xtensa               randconfig-r2102-20261012    gcc-13.4.0 cocci
xtensa               randconfig-r2104-20261012    gcc-9.5.0  cocci
xtensa               randconfig-r2104-20261013    gcc-14.3.0 cocci
xtensa               randconfig-r2105-20261013    clang-22   cocci
xtensa               randconfig-r2107-20261013    gcc-14.3.0 cocci
xtensa               randconfig-r2301-20261012    clang-24   sparse
xtensa               randconfig-r2303-20261012    clang-24   sparse
xtensa               randconfig-r2303-20261014    clang-24   sparse
xtensa               randconfig-r2306-20261012    gcc-16.1.0 sparse
xtensa               randconfig-r2307-20261013    gcc-9.5.0  sparse
xtensa               randconfig-r2309-20261013    gcc-10.5.0 sparse
xtensa               randconfig-r2309-20261013    gcc-13.4.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
