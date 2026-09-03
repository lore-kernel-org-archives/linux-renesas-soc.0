Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72844356750
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 03:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405593; cv=none; b=Nrxm1RLMY4nZ0bubnuGb2Pz+uQV2A6qQ3rVpvGJ475+4Mu7IbDck1KlAnh1hrAljMRp8pBU9nZIVGdrDCCLt4aPy1hi0ruM7F24hbNH531oD7q1CgSWsATe/G5fOMEx6bMWG5dB+UJ86Lq7+N1g7liXYzvkgk2xyNyVOe6Qv/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405593; c=relaxed/simple;
	bh=zSGTBApy8uuOuvfbj0m3XS8qx1FaPX8txEhguAHDJI8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q1m8Obc6XRDlpMEsWsMep03CVouIXFh/oxUpe9WzuYzAuUD2E6W0BdLfpNHWf3yTrW14+BFycHHQl4hiqVSvQjCEffOrqrKSDGIEZZCoYnKWKg0g9nRB1L8efONDD0hdwhMKkxbyjuNz2AnVmyBwPI6rRqRtJkXYtMIdrC4VcRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlDqnB/3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlDqnB/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788405591; x=1819941591;
  h=date:from:to:cc:subject:message-id;
  bh=zSGTBApy8uuOuvfbj0m3XS8qx1FaPX8txEhguAHDJI8=;
  b=PlDqnB/3aZKqJxJZ99Fw7Vuj8Vvlhao6GzchdkB09j7ZqtfrVvoDPgts
   6VOs1qG8TfIP+xj7GAVdS1/qGpH4H0rkML2HBbesnVZ3cYfDkquVWrtkc
   QA90GZVaeJACUNRX+Y7U7NQ7dlfFfiZfMjhgMB8BUNT/LfKlX6Zd2rOoI
   p4rTfJdizYz+PMNxqmu8SoSZtJbnZIne1f3v/Zh2c4MYd6n2MdYI8S3Uy
   hZUkma27EHFZ6my3AZ0fBRW2NpowdEzD/umRVCEhs+X2ZK/2Xi88NZTjs
   leUbKd5S+4WM7gPha7Aew7V4sujOztBFXQhmcPifbGj4tsatJlLvBPvXm
   Q==;
X-CSE-ConnectionGUID: 3Gz3cdO+RlivjKfLDIR7Cw==
X-CSE-MsgGUID: RhSaeCRDRsegTkkpuZNSVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92693473"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92693473"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 20:18:43 -0700
X-CSE-ConnectionGUID: qTMyHR+TQOiqZshdq6IVkA==
X-CSE-MsgGUID: n1LcpSkhSa2zW6Ptj55fBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="271549585"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Sep 2026 20:18:42 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1xyJ-000000003tw-3hyo;
	Thu, 03 Sep 2026 03:18:39 +0000
Date: Thu, 03 Sep 2026 11:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 e02318dacbf6aaf440ec30e1c5314a80548d3174
Message-ID: <202609031109.2PTeQcTg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: e02318dacbf6aaf440ec30e1c5314a80548d3174  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 2257m

configs tested: 70
configs skipped: 1

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
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
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
