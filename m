Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324C1417BCA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 06:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503896; cv=none; b=hmAgE3XAk/irLn51IrSX6sL52OcD9RWJ6VZafi7i05EN5iBwLclg6pHanFlVkR3NGLvKNQUR02oon72h79U/+gPMZVWeBPJy7Et5zC/R3PgZKDsg4X+1bWkFDi5KfUg6ffJYr0MNrQmgvi8rVkidl+dSXc6PXf9MMzUN3CBK1BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503896; c=relaxed/simple;
	bh=Gi+BF9pMzsV1Aa7zkGeWafSLTdmqnDfFpiUM930GWUU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mg2OVOe0p95lfp9iFke2hN8ogIb6y3ZFmrIlC1f3LQ8hYyjfpzn+hXBw5qmCJvnzI95bol5P4Gozf7tYvLNDFnZoN+IkGf8y7D0g7Arp33mEuox4MmVnbTrbk3znvH2/4cGlx8qg8DUNtLrOdcGfI1hM0YLk/tPDW3xmsDZKaWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEsYqzpb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEsYqzpb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788503894; x=1820039894;
  h=date:from:to:cc:subject:message-id;
  bh=Gi+BF9pMzsV1Aa7zkGeWafSLTdmqnDfFpiUM930GWUU=;
  b=aEsYqzpbRKEkaMG8aTMNciLEevqFHB48nfZjXhSblsQY7IdFrtig6f4g
   pNJROudwl8uCcaNyV+XpFUkQAXzJXpDj7s9aLOVkWr8jh5xmcaWXaj1rI
   eajAYCYEOmpP/EeXJs+4bmvf2zlY845uknpKVDfCySOPLgqceFuNAh1Np
   lNOXITQwpp2fN5SCp2MriCTs/VlYxO74BYCpzS5ApsaFa0BlXAHSv5vvw
   O2SDbyYnQpvsdnS/aUu6vqQJU+zI28yZS1yADgRwSmArZB9UGPP8KTss7
   v6tlg5OnCqijsltA5rIZr8/sS4erk448MS0Euzu9pFdMTDYhjf1z/xxit
   g==;
X-CSE-ConnectionGUID: ppmHDXYcRnW2i9J+McvEdA==
X-CSE-MsgGUID: aCzA1wQwQC6LPPOX4HOv+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88764131"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88764131"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 23:38:12 -0700
X-CSE-ConnectionGUID: OObEqthdSdSDCQdzeIvGTg==
X-CSE-MsgGUID: zZCPyCF2QFGZMZVv0LNcPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="275239104"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2026 23:38:11 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2NYu-000000005zU-3pSO;
	Fri, 04 Sep 2026 06:38:08 +0000
Date: Fri, 04 Sep 2026 14:38:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v7.4] BUILD SUCCESS
 5c9b0eda22ec63c98286c52dc05ae348869b04eb
Message-ID: <202609041403.Ykb7mt43-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.4
branch HEAD: 5c9b0eda22ec63c98286c52dc05ae348869b04eb  arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot partitions read-only

elapsed time: 2483m

configs tested: 18
configs skipped: 56

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc        allyesconfig    gcc-16.1.0
arm         allnoconfig    clang-17
arm        allyesconfig    gcc-16.1.0
arm64      allmodconfig    clang-24
arm64       allnoconfig    gcc-16.1.0
loongarch  allmodconfig    clang-19
nios2       allnoconfig    clang-24
openrisc    allnoconfig    clang-24
parisc      allnoconfig    clang-24
powerpc     allnoconfig    clang-24
riscv      allmodconfig    clang-24
riscv       allnoconfig    clang-24
s390        allnoconfig    clang-24
sh          allnoconfig    clang-24
sparc       allnoconfig    clang-24
um          allnoconfig    clang-24
x86_64      allnoconfig    clang-24
xtensa      allnoconfig    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
