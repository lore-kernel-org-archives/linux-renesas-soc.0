Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792815593;
	b=PvnJcWf0uXHwk9ddqN3hZgjTp1ibVlHms539/4eoDCQcJjy8dma6zWe49tJPndq510CB
	 J+NANmdFFLnDew7J3S87ghVbZCXt1u4Hvv/xxPTnUKWTunF3LTFmNb0oy+TavPJkxA1NT
	 m58CCMvqLAIFkrxK7erQggFkHQjsgw0Zip+zLPc1lPcahLYrEUH1yFcpOu2Alx8WYb3dz
	 +kTHxWLiuI2B/4lDf7Khxe3NpVJbc6fQdVmCsuC47V/YXvmQPU9Ulyu3BrOAJrOgMsxBs
	 Gw8/FBSIgn+NzMJdyIUnA90g23MDanldVC5nQicZm07J2+PVYxVquyQRHbD0faAZrVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792815593;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=x0oly4lOOcktSlhnHmNr4UBhBflw4gfbCcOwbW5ADrs=;
	b=RVIjWgqYGxhxCYGEpEGzOweoqOnAXUFp0sCArprw1zQP3g82y63QRsP7+x0lCPwlPHYC
	 PuVJKR/+c2xQBJ3H4bwNYpBeR6KZn9PhSp4WiDMGvI5MLFt8pc1lm+b6s8RT+2YvThGsh
	 L2lSWQjB9RXKzqGafzWbKUllPWf1dWG5XUJfpcarmJ45x3RQoGWfI7MuU8YPBkjzu3Csd
	 lpbkBySYZwZtVA+L5wflEeItE7+ZGmVdmmVMftARv8hNYiTAw2UnZs7APpEcNSWJE/lFk
	 UU2jK0JXJz3+kVGAP2vA0JF9MVq12ISm5Q6jdpt4ARXY+7MfG9z9o0moqolg6gY6F1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eyAwFCnF;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A92606A31A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Oct 2026 04:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A92606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eyAwFCnF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792815591; x=1824351591;
  h=date:from:to:cc:subject:message-id;
  bh=ASZwPO/DfTt9gRqGfIoY4b7Q4fpUzpcjC9g2Uv5VapE=;
  b=eyAwFCnFeu9mO7BhFEz956zACAibP1vLFnjRzOzjifpgyvgpfOFTzLQa
   MO5Mgj5xcLrGAcgu48cJkXbdo0h1p7CUX4KuaYERRtjnLl4u+jbZjAR4o
   CGuYStF+mt2udqXEYEba8W+R0Sop6Ttj91FEnnWgqJsYQN4jolBZvRhFY
   uyqdK+3xC79n0h6jo0wjw4VIoUJGtgD2Iy/T6HgnMaoOZg8eW62fa+fr2
   Yl1329kFe+1SGVba5U2vYOFG2m9nPnrQ4y29BlGrXXiQ/fhPotRvgEnvG
   NCx/6FDDfjOGDpl188veuFUowfLMxu7piKSp++LlosmUtI13J8pOnSDGr
   w==;
X-CSE-ConnectionGUID: WEqk0+G4Ta2n6DIlUgaiKQ==
X-CSE-MsgGUID: GWYBymnRSuyiqh4f6bEfNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1468035"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1468035"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 21:19:51 -0700
X-CSE-ConnectionGUID: wKkT30+rS6a1kW8wE7XPjQ==
X-CSE-MsgGUID: ahLhANnyTFG7o8xVomlrAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="4191466"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2026 21:19:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKTER-00000000TZq-3VfF;
	Sat, 24 Oct 2026 04:19:47 +0000
Date: Sat, 24 Oct 2026 12:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 0a583e44d9931ad18ab8f6371b763155830c95d4
Message-ID: <202610241249.CBWDgIMn-lkp@intel.com>
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
branch HEAD: 0a583e44d9931ad18ab8f6371b763155830c95d4  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 3980m

configs tested: 58
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                    allnoconfig    gcc-16.2.0
alpha                   allyesconfig    gcc-16.2.0
arc                     allmodconfig    gcc-16.2.0
arc                      allnoconfig    gcc-16.2.0
arc                     allyesconfig    gcc-16.2.0
arm                      allnoconfig    clang-17
arm                     allyesconfig    gcc-16.2.0
arm64                   allmodconfig    clang-24
arm64                    allnoconfig    gcc-16.2.0
csky                    allmodconfig    gcc-16.2.0
csky                     allnoconfig    gcc-16.2.0
hexagon                 allmodconfig    clang-24
hexagon                  allnoconfig    clang-24
i386                     allnoconfig    gcc-14
i386        randconfig-2200-20261020    gcc-12     smatch
loongarch               allmodconfig    clang-19
loongarch                allnoconfig    clang-20
m68k                    allmodconfig    gcc-16.2.0
m68k                     allnoconfig    gcc-16.2.0
m68k                    allyesconfig    gcc-16.2.0
microblaze               allnoconfig    gcc-16.2.0
microblaze              allyesconfig    gcc-16.2.0
mips                    allmodconfig    gcc-16.2.0
mips                     allnoconfig    gcc-16.2.0
mips                    allyesconfig    gcc-16.2.0
nios2                   allmodconfig    gcc-11.5.0
nios2                    allnoconfig    gcc-11.5.0
openrisc                allmodconfig    gcc-16.2.0
openrisc                 allnoconfig    gcc-16.2.0
parisc                  allmodconfig    gcc-16.2.0
parisc                   allnoconfig    gcc-16.2.0
parisc                  allyesconfig    gcc-16.2.0
powerpc                 allmodconfig    gcc-16.2.0
powerpc                  allnoconfig    gcc-16.2.0
riscv                   allmodconfig    clang-24
riscv                    allnoconfig    gcc-16.2.0
riscv                   allyesconfig    clang-24
s390                    allmodconfig    clang-24
s390                     allnoconfig    clang-24
s390                    allyesconfig    gcc-16.2.0
sh                      allmodconfig    gcc-16.2.0
sh                       allnoconfig    gcc-16.2.0
sh                      allyesconfig    gcc-16.2.0
sparc                    allnoconfig    gcc-16.2.0
sparc64                 allmodconfig    clang-20
um                      allmodconfig    clang-17
um                       allnoconfig    clang-17
um                      allyesconfig    gcc-14
x86_64                   allnoconfig    clang-22
x86_64      randconfig-2100-20261020    gcc-14     cocci
x86_64      randconfig-2101-20261020    gcc-14     cocci
x86_64      randconfig-2102-20261020    clang-22   cocci
x86_64      randconfig-2103-20261020    gcc-14     cocci
x86_64      randconfig-2104-20261020    clang-22   cocci
x86_64      randconfig-2105-20261020    clang-22   cocci
x86_64      randconfig-2200-20261020    gcc-14     smatch
xtensa                   allnoconfig    gcc-16.2.0
xtensa                  allyesconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
