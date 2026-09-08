Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752C04B0492
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869396; cv=none; b=tk/B9aUBGlhICneCu3EsYtRctcN44EcjuzFkGkBHTdgofJDxC2sBDswOCmPmI2JE8mOIagrsC58Ixa2Ym03RIVV7bQnB6Ze2q5m3wneh8tc54VJS2Y6Q1wgLWt7QqdxrmiSj0DIOCVV0w0TrsX9oYe8gEGWro7rwULyj1/MwCq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869396; c=relaxed/simple;
	bh=KO7i4NDIiO6iV+qVhw0J8t+41eTfKn9xe8LXzyh+52E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZF0D7Kfs9c4bcDxxXNw1GI7mTTUVzHce/T2hY1l0a4RHS0JLv667/ifp8ANGTiVhjaLg5ZiRIJpMBsuEMW1oUX4jJfPRMlEAgLHvN3OM81V7QrKurOmQmOWnXWqAyMDXnOnqwZmpnjdlzFo2qUlN16ZzcLHUkHQEszPTixWk2x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQy1yewT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQy1yewT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788869386; x=1820405386;
  h=date:from:to:cc:subject:message-id;
  bh=KO7i4NDIiO6iV+qVhw0J8t+41eTfKn9xe8LXzyh+52E=;
  b=jQy1yewTufj9OH2Iry6rH7ol9D7Mw4Z5GjADw9JzjwqniQWsJTfFOoGO
   V6xYDQZBh8/DD2sHMsJ8ZotXiH2TCwRZJ2hCHeCSMOj1qc9mCJenAO98A
   uf7d3w6agsIkYx9Nq4nd11nqsG5QYJrGQ2htJYNtEZBrpVBB6Tiw4hmOG
   UVaIzSVPXp5Y8B0z1OClqSoplBfTz99zkZMGypcdnjWVbmy7AsCwyCcO8
   YUmHTRHyuu3qkWQwmpFTexMdMDSJ1RW/4cid9cRGP9MykfrXHenSucwlL
   yQFtVjhRQxRfrKkNxOYCV5DmhnaxTywYxJFykVufbHUG3xk0xlf9xFdvb
   A==;
X-CSE-ConnectionGUID: NzzBlyQfQJaBVKsXEV35WQ==
X-CSE-MsgGUID: gvrhjfLKQ9eYwmV6HXSNEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106784215"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="106784215"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 05:09:34 -0700
X-CSE-ConnectionGUID: F5zSvLVBTJiw/ZAwlCfNXg==
X-CSE-MsgGUID: saIvyYGPShaMxRySt71TlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267728316"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Sep 2026 05:09:32 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3udm-0000000005F-0lc8;
	Tue, 08 Sep 2026 12:09:30 +0000
Date: Tue, 08 Sep 2026 20:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 a90222863512b4c6a3a5cefdb943921cd1c0eb53
Message-ID: <202609082009.GyDuDdTJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: a90222863512b4c6a3a5cefdb943921cd1c0eb53  Merge branch 'renesas-next', tag 'v7.3-rc2' into renesas-devel

elapsed time: 1553m

configs tested: 78
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
