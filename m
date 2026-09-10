Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F7947CC79
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2026 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041516; cv=none; b=abQYAqEVxw6kPu4LRfz5ebJsAjn09dJg6Ep7WKufWbJ2rYtmrBgKagY/9FblyVpKKym8pYgUQ/V0TgPneVQ1SbnN8kSo5Z/jHfCqBhoLHni7n+YjcqTCq95rucqQcAdxvffh+v2Z7GLL2nDIpqjpXZSKzrEUlhAi4X/i11Q3rcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041516; c=relaxed/simple;
	bh=OXueIHA6FZXzJT8TAR+Zgvx4S1gvL0pyqWDAZYEWxGU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oGRY3T3wSmvTeXr2vW0tJpvrKCd5VcQDA9y/sCPhJI9hki9ojueqmfmhSS0YgsW2uaiSbu2sCRuUEUFEHW9P2b7nKVG2AsLXUXV7Zu9Q7v5pTUGrgdwoiR7lsR3dWd3fgEZPb4RXNCpcTEcodxZYQNs/Kc0tf77PRc8ax/9H80Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vzyqso1U; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vzyqso1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789041515; x=1820577515;
  h=date:from:to:cc:subject:message-id;
  bh=OXueIHA6FZXzJT8TAR+Zgvx4S1gvL0pyqWDAZYEWxGU=;
  b=Vzyqso1U0AqBa7uTRKiHvfi+lH9IxNCSkbyaBhFGMcCJrQJC4wOlopvv
   u05LCiaVA/llv6f+hZ0yw09lB6gpkYAfdLyrcj32ZEmvlxbIHPRBnr7nn
   m8e+RHG8XxSGEaRSxlvVhYfMqdAJBjKyTquflH7OB1XKzxjgdfg6iNeCJ
   NUUs8QEOmsU93bes9NNepyUxaBRDTEwPyoLl00+mF2HVBs+vqp8tNEbAd
   1IfGfjPpAt8fRHhVbsTnWzkwLbkC99LHhptAsO9xhijKesFi9ICRx3jAS
   GinP9mgTZ5CmJX4rIUcSd9XNdW2fBPC40Xb1dMq/amYTtIf0KpQINqqtq
   w==;
X-CSE-ConnectionGUID: zqN9087ATJG+WPLLsVS9Fg==
X-CSE-MsgGUID: i/hFoTBVSn+5KvC5ZR/QZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="10600"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="10600"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:58:33 -0700
X-CSE-ConnectionGUID: ypeicZtPSnSvvaWrTy5l6A==
X-CSE-MsgGUID: Zecb5xMcTyyh60/pUE+iug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="269039626"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2026 04:58:32 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4dQD-000000001m5-3hBv;
	Thu, 10 Sep 2026 11:58:29 +0000
Date: Thu, 10 Sep 2026 19:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v7.4] BUILD SUCCESS
 eb3aaa2249eb2f4224bc27874f5d685471653142
Message-ID: <202609101944.Jo9Fa7WI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.4
branch HEAD: eb3aaa2249eb2f4224bc27874f5d685471653142  arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update PCIe node

elapsed time: 1305m

configs tested: 55
configs skipped: 40

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
