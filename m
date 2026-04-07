Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C586F26290
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 20:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775594778; cv=none; b=pJgqrT7oQrHOCTx4rCfEpC7TfZ7cIPBUgk+mXnng1qcZcrmLNRxuIvOAU2y2BFkEH/SZY4iRLTHNb9xGBFdQdyCeqKU+jjRFKF4Ud6svWaB9t6A91YkYn3yaLUnIhpIJ6Qiv3wknsXBnhB6EfgKPSXYXMWJQA8R63BJnDxloa/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775594778; c=relaxed/simple;
	bh=vs76oPiy5/3XOgzImxU6FUAfXh7R2owaJagkNI8wN5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d+mMYrslvgRJYo25UjiENXUMP6puZsvBQP9c3aBi+aQYoHvRPkP1teRas8yIyTFa8bKwdq0j3zz0rdbw55Taycjx615v21oUUEB4+3DAusPImjQFe1NWr+yu4ua45zpYsX0Nkvw0rcVga9nIh0yz4uHuBdFhP8KIsw9OT7UneTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkG0U9Yl; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkG0U9Yl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775594777; x=1807130777;
  h=date:from:to:cc:subject:message-id;
  bh=vs76oPiy5/3XOgzImxU6FUAfXh7R2owaJagkNI8wN5k=;
  b=jkG0U9YlF6MtVxDZZ13RF3xTqwB70Hqqb1/AJgDWAY36EcjbvEPJerG7
   DwQKPAafuRlifMx/5AH0GAxa1+umZ2aCwZ9sKibEm6Xy6HCkOer3pTdXE
   vd9WMqsjCzxxHYaPyG0vCX3rNqcxSM7TwnGb/gpVGllj8elUN+/ZQX+uy
   mS9Lj+EdOhUzRew75M41LLo+79/3DSPE5oYO6z0TQgs1LbXkk1zXbAbPq
   Ap32S6fSj7zE3Ex6LSp8m85RskV8UpnPyyYTf9hp6+lwjZrFq8QUpG/nO
   VJIgNN4msBPFAkAoRx6Zf9yD/AlsaVFZtbadU11/Dk0/NwpySuo7Whdp1
   Q==;
X-CSE-ConnectionGUID: fuB8cxYJTKmdpUruDWwwnw==
X-CSE-MsgGUID: FYSMlKlXToioSVKvYAs1GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="75740003"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="75740003"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 13:46:16 -0700
X-CSE-ConnectionGUID: YQVKqIXmTRm8XFaReDsWow==
X-CSE-MsgGUID: DANT6SnBQMuzUMUSWTlf2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="233236100"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Apr 2026 13:46:15 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wADJM-0000000011x-1CwR;
	Tue, 07 Apr 2026 20:46:12 +0000
Date: Wed, 08 Apr 2026 04:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 ee34049208225e0419414b9050e4a093a35165b2
Message-ID: <202604080418.SpvxSjfX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: ee34049208225e0419414b9050e4a093a35165b2  Merge branch 'renesas-dts-for-v7.2' into renesas-devel

elapsed time: 1337m

configs tested: 54
configs skipped: 1

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
