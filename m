Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EE02F8E93
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 19:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786648331; cv=none; b=VcgnEoMDG+eJ2IHTJiz7DbFugs4OlZR1hrLS5tGjz27iO2m6pavFzK5sF/XSONpRTIAFENkOM4QOAJVBn37G4+nC86v13U0Mb1F4t138j16EhGkDktY3DLsLcSQ7ZvgNynP5JPJRIqUuzfncM8BxXkDaZRTVM9XMVX87tkxN+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786648331; c=relaxed/simple;
	bh=p1Diy+rcJ+ZRmgiLc+ZTd4Gt0M8BFm270ywMEwTJrd0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZSyCV4i+o/GYi8uXw1RDvU2uCIDNn377VUvLVWYL3QQV4GeKyamGcZiuciAeDcb8/AdRMhHp2voXjIxcyOTBMU5LwLxVSB5XP63t4BbZpAgzhFQUVOo8cLd+dPCYNmzqPNvvbTqcgeAQ97Y2kYHtJybXG12iH8GrjIk0xoBSLwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYzJoOIZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYzJoOIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786648328; x=1818184328;
  h=date:from:to:cc:subject:message-id;
  bh=p1Diy+rcJ+ZRmgiLc+ZTd4Gt0M8BFm270ywMEwTJrd0=;
  b=bYzJoOIZFQwQmQLZgQS1Ve02V0FmtZ00oce+vJkczfemzQfs7Khl1Vf/
   BvcIX7h3tqpIzzTEAlfTeFKNi6VVro+e5nqtlETVC6OuN5FGfNnBI+NjN
   WZfUtmKoW51KD1cMNDQYQ8KAUBTMWo8bgPDerF+VfVyZd3stdQIToAsSD
   WcHIF8RP5wJMI9wm7FbwutjfjoA/WXntwFDZBqppd0Gi7zwntRpgW6/RY
   1qs9K6Yco3xYaYN0tS+a3gOBm7s+AabYyP/sgb37SABygGil19CQSABbA
   rJIqtWF/9Kof1eQZ/tU0xYnUwtT+EN6altYWbs0fQ7+6HTYUd0uvn71rL
   A==;
X-CSE-ConnectionGUID: dvrV2CdFR1WWT2JpAcxi6g==
X-CSE-MsgGUID: og14kL9mSbqkFLUYhdaFwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="74770148"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="74770148"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 12:12:06 -0700
X-CSE-ConnectionGUID: /2AP5ZHASAmhhfvmCEwe7A==
X-CSE-MsgGUID: wwPedWQYTG+LmGnQqbaXPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="266023256"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Aug 2026 12:12:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuaqR-00000000WI8-0Xko;
	Thu, 13 Aug 2026 19:12:03 +0000
Date: Fri, 14 Aug 2026 03:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 64c88698c3579bde7ec56b38c901465c1dcc797c
Message-ID: <202608140335.c2eX7ZwO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 64c88698c3579bde7ec56b38c901465c1dcc797c  Merge branches 'renesas-drivers-for-v7.4' and 'renesas-dts-for-v7.4' into renesas-devel

elapsed time: 741m

configs tested: 15
configs skipped: 0

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
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
parisc       allmodconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
parisc          defconfig    gcc-16.1.0
sh              defconfig    gcc-16.1.0
xtensa     virt_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
