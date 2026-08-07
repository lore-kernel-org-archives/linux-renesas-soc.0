Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E391F2E1EE0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2026 17:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786124623; cv=none; b=Qmiv7tvE9ZJH/uDxS1DUdWUNWhBMj3pqjBv/YbL17iSALcZJdym7xBF8TdSyVDKeLemQSjRa6cFxtR0Gfs2z8xTpiBrHy/gpQ5tx1uE6Cwjb+4ZD+AUaDzZYeqhZhS84aTOagjjuAQ7eaZ6xW7ghOb8fXZodw79VJWJMeX+S+i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786124623; c=relaxed/simple;
	bh=IrMm/lbeFGOArUbz9bFRCx8kqJg6ovQZ9c/NfeMwcMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K2DMLhbsB4nKFEO09CT8mugozCSLp2TT5EmRy0Zg4BiHoMJKprJ+LZ5Np0/7KnGkW4L4FeoyN2sJFaFVObPa78uu6mkllbHY3DH6C/d+xHyxRIgVkluLGBYTAZ0duclzb6H3z/OkR1BoAhTAY6bn8cIqRrC0/BEap3OQjtVJsaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTJWdIey; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTJWdIey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786124622; x=1817660622;
  h=date:from:to:cc:subject:message-id;
  bh=IrMm/lbeFGOArUbz9bFRCx8kqJg6ovQZ9c/NfeMwcMk=;
  b=dTJWdIey0B5Sw+CQOq232InzehIwsIJsbH5r80m1dBb0SzjFd44T731f
   unEDDrzHjMgSH+lOzsOtXh+nBJlVeIAYgIvaz8l93gcGnfxi+8apUA3vS
   nbtwId1xuAe7QH2bQQezExT/iZDDnuQ92qrrIf9+X0OWK8h5Bp0QyIhfz
   wYNs1pIChcXJsNxH/NqRol9sIbqQKbwMPZOC9SNYeBBnT2ElTEBDcvyh4
   +c1/x+GaHXxiSG/sQY210wGMlUn4YdNfh+DfE17rW96VpDXZPM5wwkORn
   ITXBERvxEPTDnGobX72E5JuJcQ3mofFUrcllU8zAmRTTZjiYktcZG9hcE
   A==;
X-CSE-ConnectionGUID: z26kH6ChSN+9Pjx5zGDvjQ==
X-CSE-MsgGUID: D09tQ9EJRKiRxwqTt9pseg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="112286261"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="112286261"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 10:43:41 -0700
X-CSE-ConnectionGUID: RFlrKVTxQ/O0V6NdGXQ8+Q==
X-CSE-MsgGUID: aVfKlnt8QziDf4R2j7GI9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259133887"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2026 10:43:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsObZ-00000000Ip3-1PwW;
	Fri, 07 Aug 2026 17:43:37 +0000
Date: Sat, 08 Aug 2026 01:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: 
 [geert-renesas-drivers:topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v3-wip]
 BUILD SUCCESS ce229a5b9ab6eafe41af8632ddd1d9da9d18877b
Message-ID: <202608080102.RQ7oCkQy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v3-wip
branch HEAD: ce229a5b9ab6eafe41af8632ddd1d9da9d18877b  --- Renesas R-Car X5H Ironhide local SCMI support ----------------

elapsed time: 2979m

configs tested: 108
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260806    gcc-11.5.0
arc                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-001-20260806    gcc-11.5.0
arm                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-003-20260806    gcc-11.5.0
arm                  randconfig-004-20260806    gcc-11.5.0
arm64                randconfig-001-20260806    gcc-13.4.0
arm64                randconfig-002-20260806    gcc-13.4.0
arm64                randconfig-003-20260806    gcc-13.4.0
arm64                randconfig-004-20260806    gcc-13.4.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260806    gcc-13.4.0
csky                 randconfig-002-20260806    gcc-13.4.0
hexagon                       randconfig-001    clang-24
hexagon              randconfig-001-20260806    clang-24
hexagon              randconfig-002-20260806    clang-24
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260806    gcc-14
i386       buildonly-randconfig-002-20260806    gcc-14
i386       buildonly-randconfig-003-20260806    gcc-14
i386       buildonly-randconfig-004-20260806    gcc-14
i386       buildonly-randconfig-005-20260806    gcc-14
i386       buildonly-randconfig-006-20260806    gcc-14
i386                          randconfig-001    clang-22
i386                 randconfig-001-20260806    clang-22
i386                 randconfig-002-20260806    clang-22
i386                 randconfig-003-20260806    clang-22
i386                 randconfig-004-20260806    clang-22
i386                 randconfig-005-20260806    clang-22
i386                 randconfig-006-20260806    clang-22
i386                 randconfig-007-20260806    clang-22
i386                 randconfig-011-20260806    clang-22
i386                 randconfig-012-20260806    clang-22
i386                 randconfig-013-20260806    clang-22
i386                 randconfig-014-20260806    clang-22
i386                 randconfig-015-20260806    clang-22
i386                 randconfig-016-20260806    clang-22
i386                 randconfig-017-20260806    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260806    clang-24
loongarch            randconfig-002-20260806    clang-24
mips                          ip22_defconfig    gcc-16.1.0
mips                          xway_defconfig    clang-19
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260806    clang-24
nios2                randconfig-002-20260806    clang-24
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260806    gcc-8.5.0
parisc               randconfig-002-20260806    gcc-8.5.0
powerpc                  motionpro_defconfig    clang-24
powerpc              randconfig-001-20260806    gcc-8.5.0
powerpc              randconfig-002-20260806    gcc-8.5.0
powerpc64            randconfig-001-20260806    gcc-8.5.0
powerpc64            randconfig-002-20260806    gcc-8.5.0
riscv                         randconfig-001    gcc-13.4.0
riscv                randconfig-001-20260806    gcc-13.4.0
riscv                randconfig-002-20260806    gcc-13.4.0
s390                 randconfig-001-20260806    gcc-13.4.0
s390                 randconfig-002-20260806    gcc-13.4.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260806    gcc-13.4.0
sh                   randconfig-002-20260806    gcc-13.4.0
sparc                         randconfig-001    gcc-8.5.0
sparc                randconfig-001-20260806    gcc-8.5.0
sparc                randconfig-002-20260806    gcc-8.5.0
sparc64              randconfig-001-20260806    gcc-8.5.0
sparc64              randconfig-002-20260806    gcc-8.5.0
um                   randconfig-001-20260806    gcc-8.5.0
um                   randconfig-002-20260806    gcc-8.5.0
x86_64              buildonly-randconfig-001    clang-22
x86_64     buildonly-randconfig-001-20260806    clang-22
x86_64     buildonly-randconfig-002-20260806    clang-22
x86_64     buildonly-randconfig-003-20260806    clang-22
x86_64     buildonly-randconfig-004-20260806    clang-22
x86_64     buildonly-randconfig-005-20260806    clang-22
x86_64     buildonly-randconfig-006-20260806    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260806    clang-22
x86_64               randconfig-002-20260806    clang-22
x86_64               randconfig-003-20260806    clang-22
x86_64               randconfig-004-20260806    clang-22
x86_64               randconfig-005-20260806    clang-22
x86_64               randconfig-006-20260806    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260806    clang-22
x86_64               randconfig-012-20260806    clang-22
x86_64               randconfig-013-20260806    clang-22
x86_64               randconfig-014-20260806    clang-22
x86_64               randconfig-015-20260806    clang-22
x86_64               randconfig-016-20260806    clang-22
x86_64               randconfig-071-20260806    gcc-14
x86_64               randconfig-072-20260806    gcc-14
x86_64               randconfig-073-20260806    gcc-14
x86_64               randconfig-074-20260806    gcc-14
x86_64               randconfig-075-20260806    gcc-14
x86_64               randconfig-076-20260806    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260806    gcc-8.5.0
xtensa               randconfig-002-20260806    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
