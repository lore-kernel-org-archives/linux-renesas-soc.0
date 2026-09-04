Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43AE1A6808
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 21:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556804; cv=none; b=iUDQINuCyfLIY+cSZC2aFYmf18pOVjrL/qpKlTYIq8Ac0N+wUa1BUKF7SxpqZsLwqAV1J/2VoWO5PdPIjxSkDK0hLuat2JLQvo/C3ox65CUmWq9u7oEljJihBOyoXB4bJKr7PRey6eYoR7WOl4816pvLVGIet+pocvwemcYedrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556804; c=relaxed/simple;
	bh=r0befUz9TZqXb8KYlmSzEcERRRfdyo4Ejhl7zyWa0YQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d0yf0MUCaVwIbuC7awLlCb3klWTFZCQvxOxp+rjSiWunQBUsJVV2AQGuNOWGB0Al/L6B1YSSIoMUNw7LD0C9Vl8DRyG+N7Jb+bTlZVPmdDObmEubS/sjmZ6+3kfWnI+bagOZGyIbCIcTDS9phI3yx/54ylYkD5isMQNL2wvdd+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUBZYNtE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUBZYNtE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788556802; x=1820092802;
  h=date:from:to:cc:subject:message-id;
  bh=r0befUz9TZqXb8KYlmSzEcERRRfdyo4Ejhl7zyWa0YQ=;
  b=eUBZYNtEdBUp2VpEL8FcOmQSu+C10Jmjw01Ghzv697Bcf6kdMX83jtHJ
   4OU2FmDklDC3/e69mh/Dd3/quupaoiBFNAwmP6n01CQAqE2hPB1Sk5aSH
   TpFILYYumqk4WztI6g9W545171on+JOqr9SpClX3ZEylNtaHqp65q2BnH
   Zs+vbt10AwDKOXGEHF3Q4IOypUDTBo+EI8+htMjPNQF9gho9QrRrSWIfT
   LDdkFimhfZRvY/wb6loG+MGGRNIRPh2tStuNPHDmJqTpI9n3r3vSHkCJx
   uBwEnZNf/9d1aL4UN/8ZfWBQlC0J/AFm2wUPdhHas6O6sdb0vsqOslG+c
   g==;
X-CSE-ConnectionGUID: N1NMXUuEQraQiB/PMA7bbA==
X-CSE-MsgGUID: Y2/Ecg2pQxOvijz+xzpE7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096990"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="89096990"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 14:20:02 -0700
X-CSE-ConnectionGUID: CPhZVZHzTDOdrE5Fue2bDA==
X-CSE-MsgGUID: lYwrje/oQHatcywOTRwRCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="267564073"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Sep 2026 14:20:01 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2bKI-00000000AAe-03S3;
	Fri, 04 Sep 2026 21:19:58 +0000
Date: Sat, 05 Sep 2026 05:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 288e04e37c645c76cfb70a15bf71f6ec65a1f366
Message-ID: <202609050543.4f2Ik7fW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 288e04e37c645c76cfb70a15bf71f6ec65a1f366  Merge branches 'renesas-drivers-for-v7.4' and 'renesas-dts-for-v7.4' into renesas-next

elapsed time: 3365m

configs tested: 74
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
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
loongarch    allmodconfig    clang-19
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
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
