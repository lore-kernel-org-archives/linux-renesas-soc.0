Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A211D33438F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 02:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786587989; cv=none; b=lbs09DKN9xsueR7tIUzOf/E1dmV9hNkE1AWs2UsSB0Y0HlKasL5kbKnBQVimLg7cA+xa/WG9hColLIGBWo4865PpDLeZCdbaiEgtbZDhiV9WNvr0w4s1v8a3QkF4IaOgDGEVuPbpvtUebEeidLKmgpPu6KFHll49+MsjqdKpEc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786587989; c=relaxed/simple;
	bh=5fFDq3mtryJ42Jw6+X8dNP/JJ6cDYi5DFx3pVkAIcWQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M5v39c9GW/0tw0PG2vmXa/Zfd1pzrh+Sh/LXqGWvVYS+E610pgn6jWPU5emf8xXFBLNFAJfEgzLzqhf3wQrXqNCmRvHsSNj/dxLxE+PIcp7wjLl55SeYtm/9VYlfjU8j21cRpPKk8fJ9XwbM64qZeVksm5GORRUnAPAksnrtKuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UfGHHm9O; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfGHHm9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786587987; x=1818123987;
  h=date:from:to:cc:subject:message-id;
  bh=5fFDq3mtryJ42Jw6+X8dNP/JJ6cDYi5DFx3pVkAIcWQ=;
  b=UfGHHm9ONop9DTDarKsn4hTnvyqv0f1TpYdRcM6kHS6gMt28O71TNIvm
   8VODxeZ/laU3tTLlnUkDL7OOxm+89NN4rb2Q6ByTpbYMk6qjj3WrC84OY
   2aWJwlNZ9+5m0cE7SnRrDHeWXnDt+eojN7yZNHfF5rOulshKahah7Tl9O
   RGuOgnFZbvG1977k1jZ4pQIDt0kYVoPT1iCjMwzarSMVhXv4KFdIfNyh6
   3R6KPS5hVOrE2cT9lNzeyTihIb3OPo39ALiVrb7GSvrrpImd+7pyVjSl1
   tTaXzsif+DANQbPBRH/53vWN1kMtzy3tpIl0gkOJn4ueYN11qEFoRy+EU
   w==;
X-CSE-ConnectionGUID: Cuet2T2tT7ORUnNl+R6GWg==
X-CSE-MsgGUID: MlVicu2qSw2+C8yIk1B56A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87176001"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87176001"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 19:26:27 -0700
X-CSE-ConnectionGUID: naG2G2f0QAK0c/MeLFFVFg==
X-CSE-MsgGUID: O+78YmLxSFaFdceFki2LNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="268987608"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Aug 2026 19:26:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuL9D-00000000SXC-2EMy;
	Thu, 13 Aug 2026 02:26:23 +0000
Date: Thu, 13 Aug 2026 10:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 b6d18f3284a550431539fb15c316b4f0fda76aff
Message-ID: <202608131045.xycsj9Mh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: b6d18f3284a550431539fb15c316b4f0fda76aff  Merge tag 'v7.2-rc7' into renesas-devel

elapsed time: 2416m

configs tested: 154
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260812    gcc-12.5.0
arc                  randconfig-001-20260813    gcc-13.4.0
arc                  randconfig-002-20260812    gcc-12.5.0
arc                  randconfig-002-20260813    gcc-13.4.0
arm                    am200epdkit_defconfig    gcc-16.1.0
arm                       keystone_defconfig    gcc-16.1.0
arm                  randconfig-001-20260812    gcc-12.5.0
arm                  randconfig-001-20260813    gcc-13.4.0
arm                  randconfig-002-20260812    gcc-12.5.0
arm                  randconfig-002-20260813    gcc-13.4.0
arm                  randconfig-003-20260812    gcc-12.5.0
arm                  randconfig-003-20260813    gcc-13.4.0
arm                  randconfig-004-20260812    gcc-12.5.0
arm                  randconfig-004-20260813    gcc-13.4.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260812    gcc-10.5.0
arm64                randconfig-001-20260812    gcc-14.3.0
arm64                randconfig-002-20260812    gcc-10.5.0
arm64                randconfig-002-20260812    gcc-14.3.0
arm64                randconfig-003-20260812    gcc-10.5.0
arm64                randconfig-003-20260812    gcc-14.3.0
arm64                randconfig-004-20260812    gcc-10.5.0
arm64                randconfig-004-20260812    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260812    gcc-10.5.0
csky                 randconfig-001-20260812    gcc-14.3.0
csky                 randconfig-002-20260812    gcc-10.5.0
csky                 randconfig-002-20260812    gcc-14.3.0
hexagon              randconfig-001-20260812    gcc-11.5.0
hexagon              randconfig-001-20260813    gcc-11.5.0
hexagon              randconfig-002-20260812    gcc-11.5.0
hexagon              randconfig-002-20260813    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    clang-22
i386       buildonly-randconfig-001-20260812    clang-22
i386       buildonly-randconfig-002-20260812    clang-22
i386       buildonly-randconfig-003-20260812    clang-22
i386       buildonly-randconfig-004-20260812    clang-22
i386       buildonly-randconfig-005-20260812    clang-22
i386       buildonly-randconfig-006-20260812    clang-22
i386                 randconfig-001-20260812    clang-22
i386                 randconfig-001-20260813    clang-22
i386                 randconfig-002-20260812    clang-22
i386                 randconfig-002-20260813    clang-22
i386                 randconfig-003-20260812    clang-22
i386                 randconfig-003-20260813    clang-22
i386                 randconfig-004-20260812    clang-22
i386                 randconfig-004-20260813    clang-22
i386                 randconfig-005-20260812    clang-22
i386                 randconfig-005-20260813    clang-22
i386                 randconfig-006-20260812    clang-22
i386                 randconfig-006-20260813    clang-22
i386                 randconfig-007-20260812    clang-22
i386                 randconfig-007-20260813    clang-22
i386                          randconfig-011    gcc-12
i386                 randconfig-011-20260812    gcc-12
i386                 randconfig-012-20260812    gcc-12
i386                 randconfig-013-20260812    gcc-12
i386                 randconfig-014-20260812    gcc-12
i386                 randconfig-015-20260812    gcc-12
i386                 randconfig-016-20260812    gcc-12
i386                 randconfig-017-20260812    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260812    gcc-11.5.0
loongarch            randconfig-001-20260813    gcc-11.5.0
loongarch            randconfig-002-20260812    gcc-11.5.0
loongarch            randconfig-002-20260813    gcc-11.5.0
mips                    cu1000-neo_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-001-20260813    gcc-11.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
nios2                randconfig-002-20260813    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260812    clang-17
parisc               randconfig-001-20260813    gcc-10.5.0
parisc               randconfig-002-20260812    clang-17
parisc               randconfig-002-20260813    gcc-10.5.0
powerpc                 mpc885_ads_defconfig    clang-24
powerpc              randconfig-001-20260812    clang-17
powerpc              randconfig-001-20260813    gcc-10.5.0
powerpc              randconfig-002-20260812    clang-17
powerpc              randconfig-002-20260813    gcc-10.5.0
powerpc64            randconfig-001-20260812    clang-17
powerpc64            randconfig-001-20260813    gcc-10.5.0
powerpc64            randconfig-002-20260812    clang-17
powerpc64            randconfig-002-20260813    gcc-10.5.0
riscv                randconfig-001-20260812    clang-24
riscv                randconfig-001-20260813    gcc-10.5.0
riscv                randconfig-002-20260812    clang-24
riscv                randconfig-002-20260813    gcc-10.5.0
s390                 randconfig-001-20260812    clang-24
s390                 randconfig-001-20260813    gcc-10.5.0
s390                 randconfig-002-20260812    clang-24
s390                 randconfig-002-20260813    gcc-10.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260812    clang-24
sh                   randconfig-001-20260813    gcc-10.5.0
sh                   randconfig-002-20260812    clang-24
sh                   randconfig-002-20260813    gcc-10.5.0
sparc                         randconfig-001    gcc-13.4.0
sparc                randconfig-001-20260812    gcc-13.4.0
sparc                randconfig-001-20260813    clang-20
sparc                randconfig-002-20260812    gcc-13.4.0
sparc                randconfig-002-20260813    clang-20
sparc64              randconfig-001-20260812    gcc-13.4.0
sparc64              randconfig-001-20260813    clang-20
sparc64              randconfig-002-20260812    gcc-13.4.0
sparc64              randconfig-002-20260813    clang-20
um                   randconfig-001-20260812    gcc-13.4.0
um                   randconfig-001-20260813    clang-20
um                   randconfig-002-20260812    gcc-13.4.0
um                   randconfig-002-20260813    clang-20
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260812    gcc-14
x86_64     buildonly-randconfig-002-20260812    gcc-14
x86_64     buildonly-randconfig-003-20260812    gcc-14
x86_64     buildonly-randconfig-004-20260812    gcc-14
x86_64     buildonly-randconfig-005-20260812    gcc-14
x86_64     buildonly-randconfig-006-20260812    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-002-20260812    clang-22
x86_64               randconfig-003-20260812    clang-22
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-005-20260812    clang-22
x86_64               randconfig-006-20260812    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260812    clang-22
x86_64               randconfig-012-20260812    clang-22
x86_64               randconfig-013-20260812    clang-22
x86_64               randconfig-014-20260812    clang-22
x86_64               randconfig-015-20260812    clang-22
x86_64               randconfig-016-20260812    clang-22
x86_64               randconfig-071-20260812    clang-22
x86_64               randconfig-072-20260812    clang-22
x86_64               randconfig-073-20260812    clang-22
x86_64               randconfig-074-20260812    clang-22
x86_64               randconfig-075-20260812    clang-22
x86_64               randconfig-076-20260812    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260812    gcc-13.4.0
xtensa               randconfig-001-20260813    clang-20
xtensa               randconfig-002-20260812    gcc-13.4.0
xtensa               randconfig-002-20260813    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
