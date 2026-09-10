Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8844657D8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2026 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041455; cv=none; b=iJBHICkrd/w3xtBheJNvN0fKRjfU03p8WXPep8p3DT1anzHU98BEhirhMvnENTk7Hps+mX7N6b/aCE8AacwuUgQyD8FTOSwANgo8n9VC0QnIhGXYksGvQ+Mr4dS3HZwwcf4uNcXIAa5AWFN3hCKxrWpyjAtvSMb/Lx1jDwe1ufI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041455; c=relaxed/simple;
	bh=TN33rLApJgYFmbNOMZ9A2Ukf501qs83zpxinfjgcxuA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gV62SEzc7DqiESvSY/WiSjorhbFvYNFkGkaamf1GX9jPsQlvTa4WXXrUYnbcDsp6Y5pj8xg+kh1scUZpySP3fP3NRte4Gf5Ac9+fpIyr7FFbKIl3ziR+Sr3Jr8YRTVDMndK+h5/FDaQgraH4E13yoWkuSriHd4dCgPFwAGIjX6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drIAKAmI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drIAKAmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789041454; x=1820577454;
  h=date:from:to:cc:subject:message-id;
  bh=TN33rLApJgYFmbNOMZ9A2Ukf501qs83zpxinfjgcxuA=;
  b=drIAKAmI3GZprghLbD4zn6oOCTbRyJblPMtBJFYwRxZv69qMEYEqHNtG
   XRV8LyvViLPHj1PMnhNrcpl+5feiRtaK/4VH3lKGg9pOSmbtTAUmbCIWS
   AW8PqwreZ30F4Fj3lq5znUPYTezEj3WhhpAV1nFBizpvmssxZg1/YzIKu
   MFOomLBcCmIRoteFVkLvDBqsa09elrQdEqMvYYT98PC6yCq9C5CW1k8Nn
   QuejcdowDtGqbU2atq+w1Qo/fkvkYONxft4aiExTSLZsK55OCuTLtZI9A
   KGPqZmBz+gdIAWe+7BwAWsQ585jJOUmLplyz2TonbAjdf1WL/MJEtN2FH
   A==;
X-CSE-ConnectionGUID: 1vFciZCsRo67zYz/zU3CTw==
X-CSE-MsgGUID: 7/yK9Rm9QnWnSCKLhu8y+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="107002094"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="107002094"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:57:33 -0700
X-CSE-ConnectionGUID: FCnV5TZhRKmY6KdTbKqiaA==
X-CSE-MsgGUID: s0kOkHS6SS+cpXf5YREGCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267326838"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2026 04:57:32 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4dPF-000000001lv-2Ucp;
	Thu, 10 Sep 2026 11:57:29 +0000
Date: Thu, 10 Sep 2026 19:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 5e3021b68ea78e06bdf4ff2bd045891bea6077d6
Message-ID: <202609101905.Yi0bc8Xz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 5e3021b68ea78e06bdf4ff2bd045891bea6077d6  Merge branches 'renesas-next' and 'topic/renesas-defconfig' into renesas-devel

elapsed time: 1305m

configs tested: 55
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
