Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF06A32B10E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 19:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786648630; cv=none; b=oW4Yv3caKfxm/T1R0MBWIdIyc96yY7alztaHdBW47D8mhv4tUXGcxA+OBhkuOGMD7g/80cI1A72SKxe6oruiJ5NHPPAhA0/KGts3mboq0EDHAbAN1UX3L5wvjCYnae5RxKT6QnLRRZPMhylF0luV6WHg7DZoJRRhTkwScHOAxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786648630; c=relaxed/simple;
	bh=U0MJ5LiX3ulZ2IlpcV8loCPA9mivsSeEO1UFtIG2FoE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WpDSjr1PQDneMy3SLJBU/3E478px8Q9kHE0/kSSN6CiPFXJGQDy9KhEOZvjDWRrm3bb258oqVXlNMdOsTmAh/0dd0OoRgdmucNsk3e8tcPRn8/odipb3OeJ96CtIXnhTWBGLQlc5XT+hTofLa2B8Gvw3FeBeYRIdP0eCggNGDuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFK2wx9c; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFK2wx9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786648629; x=1818184629;
  h=date:from:to:cc:subject:message-id;
  bh=U0MJ5LiX3ulZ2IlpcV8loCPA9mivsSeEO1UFtIG2FoE=;
  b=eFK2wx9cdW5et2MC0ZUTr5HTXP+coXliI3ACx4faVh4jplCDH4RUvdVE
   Ap2hHvd5B4tI6uvnQCLH2c/gKE4FZrzqciM47iMhY30cCg2VP/7IwZxqw
   AMAZOoA70tJTdFm296L7DKRzeeoNEAY9YFxhpYLKcFQoRlYhe4pVRVg3D
   eRp7Uonv9YMg4/ZSCYAkjb7sPpSq1O8Onz19/1G5GVuGgBFsocfWcpa2t
   CYmxP9v8h67e1PysB5UN/0EyRuRCFmyKE5Vf32AGA0h+QVg479spwZ3fV
   CjjGfZjFltovTTaX3auMCo7sJANxjW5suqMx/G8Dt3id7kbvKTQSZ7SfT
   w==;
X-CSE-ConnectionGUID: 67bJS6biTb+Fx4f5F+y2Uw==
X-CSE-MsgGUID: BiKJ37cQSAartlLTyvpBWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97580093"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="97580093"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 12:17:08 -0700
X-CSE-ConnectionGUID: u0VxVsZcR0K/SIHxnq7z1w==
X-CSE-MsgGUID: 11ifDQ3uRa2duOhpyGEZrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="264050603"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Aug 2026 12:17:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuavJ-00000000WKa-1oZM;
	Thu, 13 Aug 2026 19:17:05 +0000
Date: Fri, 14 Aug 2026 03:16:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v7.4] BUILD SUCCESS
 306626aaebb52d01fceb4bf8781855754183c482
Message-ID: <202608140334.fTY3sLqV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v7.4
branch HEAD: 306626aaebb52d01fceb4bf8781855754183c482  clk: renesas: Clean-up simple provider misuse of the consumer API

elapsed time: 744m

configs tested: 15
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
alpha           defconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc          allyesconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
i386         allmodconfig    gcc-14
loongarch       defconfig    clang-24
mips       rs90_defconfig    gcc-16.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
parisc       allmodconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
parisc          defconfig    gcc-16.1.0
sh              defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
