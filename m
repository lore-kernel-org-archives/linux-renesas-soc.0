Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33FC396572
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 06:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503894; cv=none; b=Do0dIJ9u8RDGB3S5XygX+Jc2mwXdKdo28e8Cm3dBHX1MrHptGSaPr7X9Tmvs53DCZa4VETL4t44nm1C3pVboP1SpuiQCSPLadL77UL1Y+W5WOKJhP4IzjgqPtv0lI+YN5U+0wP+uc/EL8W4/+CiKs6gqYOtIg+836jUoWyk4F34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503894; c=relaxed/simple;
	bh=y1gFsQsI9hFTyd4Knk5R3zI9KRFmP1QSseDhZSxK0OQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pn+/R4gShjWt01eaoxcFLVd/9tMCL0m88bNlJI9dqRD+DNo7KH+9mNSnvtGCGc3u6f6kXyQ4gnkUZAaLi/xZCHAeflvtyQI9ZdSlhT2tOEXwWO8e17YlZW6jaOqpaYRkT2yQyRnMcF6qXgUYohasuMEq3bU5bLSiFzxbZP59Kw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKbyTz90; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKbyTz90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788503893; x=1820039893;
  h=date:from:to:cc:subject:message-id;
  bh=y1gFsQsI9hFTyd4Knk5R3zI9KRFmP1QSseDhZSxK0OQ=;
  b=SKbyTz90wsqQWKKqgfI/IDRjm6BrzJ1OQFT5RZdbGdFHRBLtj9Amwq8K
   V9bShHpfw6uwQam8lJZgLgD/9xXCE/IOnC+y97ovIuMRioHHhcN2yC7sc
   UWs48nSW2voeHgj++oCiXgQGQQSDMrzy0+8xpvj9xvRsb2C0jJtuvPYik
   xYWiP2OQGCvp5NwlslpruYCA+yyOUp2rOO6nt5QvS8To0KVvD6HAy5MM2
   YXZU5tYgBPHINNd2G8sT4NALh0cWqTbrYuvSH7XjUzPaxfoENTZntd/mK
   KLd6Ti89wNTy1mwMBlshz0KAaTqTzcAUon5DRNHULZKyVjVFIkVsaoHQY
   g==;
X-CSE-ConnectionGUID: 6L3KgYlESqS1oxOHpqCQZw==
X-CSE-MsgGUID: G31aABEdTZWdha6YN0yKyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88764129"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88764129"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 23:38:12 -0700
X-CSE-ConnectionGUID: bcUAXC3aQ8+7ynS5O0CqfA==
X-CSE-MsgGUID: nAbPTSQHQg2EyBvypawN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="275239101"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2026 23:38:11 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2NYu-000000005zS-3Wit;
	Fri, 04 Sep 2026 06:38:08 +0000
Date: Fri, 04 Sep 2026 14:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:fixes] BUILD SUCCESS
 2ac7bad110be6ebe478d6bd57821f7f5259a1f54
Message-ID: <202609041451.n34hBL4G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git fixes
branch HEAD: 2ac7bad110be6ebe478d6bd57821f7f5259a1f54  arm64: dts: renesas: r9a09g087: Switch GBETH TX queue scheduling to WRR

elapsed time: 2483m

configs tested: 30
configs skipped: 66

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-16.1.0
arc          allnoconfig    gcc-16.1.0
arc         allyesconfig    gcc-16.1.0
arm          allnoconfig    clang-17
arm64       allmodconfig    clang-24
arm64        allnoconfig    gcc-16.1.0
csky         allnoconfig    gcc-16.1.0
hexagon      allnoconfig    clang-24
i386         allnoconfig    gcc-14
loongarch   allmodconfig    clang-19
loongarch    allnoconfig    clang-20
m68k         allnoconfig    gcc-16.1.0
microblaze   allnoconfig    gcc-16.1.0
mips        allmodconfig    gcc-16.1.0
mips         allnoconfig    gcc-16.1.0
nios2        allnoconfig    clang-24
openrisc     allnoconfig    clang-24
parisc      allmodconfig    gcc-16.1.0
parisc       allnoconfig    clang-24
powerpc     allmodconfig    gcc-16.1.0
powerpc      allnoconfig    clang-24
riscv       allmodconfig    clang-24
riscv        allnoconfig    clang-24
s390         allnoconfig    clang-24
s390        allyesconfig    gcc-16.1.0
sh           allnoconfig    clang-24
sparc        allnoconfig    clang-24
um           allnoconfig    clang-24
x86_64       allnoconfig    clang-24
xtensa       allnoconfig    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
