Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D03CB8F0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2026 03:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785813042; cv=none; b=a8cgiwOsJyHoBrPt2VjcAsZw468Fgk0f2piuh1sMO84pg7+8bQNHuwgnY7bAw1H4Jw7UMq2/QWj/nBfNUbH/u2K8Uer55Ow1AFIgdkJt39oO4g8Ig0MYpc/OyuvtGPgJsI/WG/K0sEJsXchHkCSDbPmtaIaiPJduROhavpbyA7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785813042; c=relaxed/simple;
	bh=2gkgWHnpHs4DuJSgO2lqHrK06eRNaXCuznXnHAzBAJ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tWzDpr3IC6kCecDyiHOu3Zlw4HHBsMUba0qihIq9XFoDjmUfcYxzdu7tfO/lON4r3BmhlzgkUFh+e/uAJIrj2N31oxNMUL30gsKy8ZK8pQrizQcj8z0i8hyTNl0uUlCd+HTVKlrKR5xxlUqE/Bzql9gMeBn5+gcMM51l8qT7BEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dN0yMSHc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dN0yMSHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785813040; x=1817349040;
  h=date:from:to:cc:subject:message-id;
  bh=2gkgWHnpHs4DuJSgO2lqHrK06eRNaXCuznXnHAzBAJ8=;
  b=dN0yMSHc2RBQ0WaZWGNODvP9Zz3WUfJk8OpQvQqiLoBFLYOQPdJk4XbU
   3rgX82uxRaU/0MreejMuSE9cUX9jUgMEaRBZY7uLZ7HXXSopL5qfUWSc7
   Q2Y7XN+BGF/kU9TCE/i3teX5nuN6YoA9EzGVzbM6moaH0dhXKF1kPPKVc
   55kq2bMpbbjqlCKjzu12o32niYebGeu/pQHGkh6IcPHXpN1RBNz2xNPNf
   eAO7KlPBhHKwKhmDoqsJRGyRkGzmJ+V+Es8d0RvkqEd9YDEDc1WwV4VzL
   IS49yBSENUZVY4ndEChwYBaY+BRStnMBJsOh3nBysCjNvJzZwBT8aV+u1
   A==;
X-CSE-ConnectionGUID: XNNYniSjQ2GO5/QU6ORQiw==
X-CSE-MsgGUID: Kcrj/fEHQiSVIKZJt12f+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86368520"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="86368520"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 20:10:39 -0700
X-CSE-ConnectionGUID: WYR3DTXJSj6wy5472xLUjA==
X-CSE-MsgGUID: LPPuUNHHQwycbfaGcRs6XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="263365688"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Aug 2026 20:10:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr5Y4-000000008nZ-0Z0M;
	Tue, 04 Aug 2026 03:10:36 +0000
Date: Tue, 04 Aug 2026 11:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 dd08d2cffccaddc3cf38dbf0dad0a0782019e23a
Message-ID: <202608041141.AL02gNTU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: dd08d2cffccaddc3cf38dbf0dad0a0782019e23a  Merge tag 'v7.2-rc6' into renesas-devel

elapsed time: 726m

configs tested: 95
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260804    gcc-8.5.0
arc                  randconfig-002-20260804    gcc-8.5.0
arm                  randconfig-001-20260804    gcc-8.5.0
arm                  randconfig-002-20260804    gcc-8.5.0
arm                  randconfig-003-20260804    gcc-8.5.0
arm                  randconfig-004-20260804    gcc-8.5.0
arm64                randconfig-001-20260804    gcc-11.5.0
arm64                randconfig-002-20260804    gcc-11.5.0
arm64                randconfig-003-20260804    gcc-11.5.0
arm64                randconfig-004-20260804    gcc-11.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260804    gcc-11.5.0
csky                 randconfig-002-20260804    gcc-11.5.0
hexagon              randconfig-001-20260804    gcc-16.1.0
hexagon              randconfig-002-20260804    gcc-16.1.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260804    gcc-14
i386       buildonly-randconfig-002-20260804    gcc-14
i386       buildonly-randconfig-003-20260804    gcc-14
i386       buildonly-randconfig-004-20260804    gcc-14
i386       buildonly-randconfig-005-20260804    gcc-14
i386       buildonly-randconfig-006-20260804    gcc-14
i386                 randconfig-001-20260804    clang-22
i386                 randconfig-002-20260804    clang-22
i386                 randconfig-003-20260804    clang-22
i386                 randconfig-004-20260804    clang-22
i386                 randconfig-005-20260804    clang-22
i386                 randconfig-006-20260804    clang-22
i386                 randconfig-007-20260804    clang-22
i386                 randconfig-011-20260804    gcc-13
i386                 randconfig-012-20260804    gcc-13
i386                 randconfig-013-20260804    gcc-13
i386                 randconfig-014-20260804    gcc-13
i386                 randconfig-015-20260804    gcc-13
i386                 randconfig-016-20260804    gcc-13
i386                 randconfig-017-20260804    gcc-13
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260804    gcc-16.1.0
loongarch            randconfig-002-20260804    gcc-16.1.0
m68k                         atari_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260804    gcc-16.1.0
nios2                randconfig-002-20260804    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260804    gcc-8.5.0
parisc               randconfig-002-20260804    gcc-8.5.0
powerpc              randconfig-001-20260804    gcc-8.5.0
powerpc              randconfig-002-20260804    gcc-8.5.0
powerpc                    taishan_defconfig    clang-21
powerpc64            randconfig-001-20260804    gcc-8.5.0
powerpc64            randconfig-002-20260804    gcc-8.5.0
sh                                 defconfig    gcc-16.1.0
sparc                randconfig-001-20260804    gcc-16.1.0
sparc                randconfig-002-20260804    gcc-16.1.0
sparc64              randconfig-001-20260804    gcc-16.1.0
sparc64              randconfig-002-20260804    gcc-16.1.0
um                   randconfig-001-20260804    gcc-16.1.0
um                   randconfig-002-20260804    gcc-16.1.0
x86_64     buildonly-randconfig-001-20260804    gcc-14
x86_64     buildonly-randconfig-002-20260804    gcc-14
x86_64     buildonly-randconfig-003-20260804    gcc-14
x86_64     buildonly-randconfig-004-20260804    gcc-14
x86_64     buildonly-randconfig-005-20260804    gcc-14
x86_64     buildonly-randconfig-006-20260804    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260804    gcc-14
x86_64               randconfig-002-20260804    gcc-14
x86_64               randconfig-003-20260804    gcc-14
x86_64               randconfig-004-20260804    gcc-14
x86_64               randconfig-005-20260804    gcc-14
x86_64               randconfig-006-20260804    gcc-14
x86_64               randconfig-011-20260804    clang-22
x86_64               randconfig-012-20260804    clang-22
x86_64               randconfig-013-20260804    clang-22
x86_64               randconfig-014-20260804    clang-22
x86_64               randconfig-015-20260804    clang-22
x86_64               randconfig-016-20260804    clang-22
x86_64                        randconfig-071    clang-22
x86_64               randconfig-071-20260804    clang-22
x86_64               randconfig-072-20260804    clang-22
x86_64               randconfig-073-20260804    clang-22
x86_64               randconfig-074-20260804    clang-22
x86_64               randconfig-075-20260804    clang-22
x86_64               randconfig-076-20260804    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260804    gcc-16.1.0
xtensa               randconfig-002-20260804    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
