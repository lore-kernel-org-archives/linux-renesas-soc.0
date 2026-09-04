Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3E234D93C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 21:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556743; cv=none; b=KnpeSlgFc1uWQC7UMgtYt/Ty2pIrRJQcWijnNao9lu57gWjw0qDyZhXbMd0SVAdttgdxTmwDHmeknLk7E18RLPbThnC+Vn+cQ8NEmUmEeI1Ztfrt4TNZFcpegOAzHQMAO3//7kvwfiBhZa6GeAPLk/LQuRQPbkR+7hwZx0VH5c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556743; c=relaxed/simple;
	bh=pZD5pZcHO08QcVb1quARWIO4gNW2r5ywrZ4dBw7CHLI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TF6y/8Aybk+6W8gXUZZgqBw2f7hyLNcTDq98p5NxvVBF6NMfILmdfjCHJU4GSlP7ZIONMY2MBMNf9Kxf6DD07/NPkwrKyt6F6memRvofPlWTHpwwVdIP+Fa0e7kiwzVYL8RtXSeYKVvUEZ8aHPAqa7C1QABdR11mUO230N7xR08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6qKV5Im; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6qKV5Im"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788556741; x=1820092741;
  h=date:from:to:cc:subject:message-id;
  bh=pZD5pZcHO08QcVb1quARWIO4gNW2r5ywrZ4dBw7CHLI=;
  b=g6qKV5ImWrN3pC/FUVhFLN5XqmdOvCiu6PzeYP9S8c1v9G46og5IT7OB
   E+FU8LeQQ7lX5B3UTsmIlWZDgOR8I7XirUmC8S8/IfSI4IWS+GmCK4H8v
   8WfIRBsL3zOwTTSQns1+6ibHJoVI5eyX8cjyfB2YDDM86KyBRhZYa80dr
   J11JPjMAo5T6N0khLxXB2VvKYGqNQafWwbK2gY/iW8wA74KBG14cNTfkZ
   3bFGZBZ3D2M+a/7faXnYoPNLIV1KIi/kTeXK5PG3pFpiS2wV0keFSTx4j
   3BGCSZPiW/rvMbz2cgtS0/SQ34LfvUixOF8rFzobR/yEu6UpsrxfJJQHQ
   Q==;
X-CSE-ConnectionGUID: T0TgPfuBRfWLygJLpFwmWw==
X-CSE-MsgGUID: YexNVlCyQhWv01KpILTYyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="114607284"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="114607284"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 14:19:01 -0700
X-CSE-ConnectionGUID: g3WJ7v2GSiG3jxPKwdp92A==
X-CSE-MsgGUID: dUAgls+LQE65CwG6FkzwLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="263935146"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Sep 2026 14:19:00 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2bJJ-00000000AAU-3oOV;
	Fri, 04 Sep 2026 21:18:57 +0000
Date: Sat, 05 Sep 2026 05:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: 
 [geert-renesas-drivers:topic:rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v3]
 BUILD SUCCESS 02c5d61866607bce0b3271e7c1b838c53dbedc55
Message-ID: <202609050537.dOD9C39S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v3
branch HEAD: 02c5d61866607bce0b3271e7c1b838c53dbedc55  --- Renesas R-Car X5H Ironhide local SCMI support ----------------

elapsed time: 3422m

configs tested: 73
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    gcc-16.1.0
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
