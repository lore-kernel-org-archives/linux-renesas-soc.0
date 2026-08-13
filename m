Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03193EB7F1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 19:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786648388; cv=none; b=qUzB+Tr+9BM0f/dsSHVPO8wXjuV+j0hfcB9gsuFn3MfAl4byaRWlZMs8R+1LbjDprQ9Xy6eYfyAK3Saqu3GyFT0G+KEgQQ35Tcc+Fn5Bu0Cuez2xBSzvBqmn1NQdhWvE4n7z55ZmNdn5kw/tCTl+RF8cOYy2RzFbTpXXgBT1om8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786648388; c=relaxed/simple;
	bh=xnHkiX88R91Wf4pl481nrc5Amjt/gqKrUdchU9XTe/Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gqs+0qUcc67xYujc3ZERRromcdETBgMnsGbKideqmxTCaEy4JVFlgUOb20wOBLQ6Q9Xr7n65TO3XxM8Ja4elCf8q0YXpehAD2DguIRLBw1dJRaoTD9j183tLj9x8A++IQGS6N3jbi2PSIVi8jiJp1okTRnq644BuStzDr1SrQNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SroaIjT2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SroaIjT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786648387; x=1818184387;
  h=date:from:to:cc:subject:message-id;
  bh=xnHkiX88R91Wf4pl481nrc5Amjt/gqKrUdchU9XTe/Y=;
  b=SroaIjT2RCptskn4uDnfdppcUdxTfwjTmP0nlRZRSllXOI5FO+IUI+9/
   xp1O899uDh5zZeCXRa/jidV2bPbX13n5TF0tZziuzNZW21wQpWIVR7CC+
   erORojwopSuUlJuLRv6MnL/whHVr1XJn8aMZzqSlX5EDCkF2sATkfOidP
   ItAfjIu/sCvcPESJOnotHH0w82eSAY5EKZkpxeyoA9TksEIqIL42yHhDf
   rkcRqBYvRZAU0XGvERMLExcQ0CtxD9xby+ALhaCXBbwjOXm8ua3AcZzjm
   /6jUi5rejShg07S2oVA2ER7y0LKbkMEm9ON0J6zdbS14tuXRKNklMZJBa
   g==;
X-CSE-ConnectionGUID: XdvNUzl5RQq2oVkvuX3xzA==
X-CSE-MsgGUID: 6ERVf6u6SCqGZRf3cqlLRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87448546"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87448546"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 12:13:07 -0700
X-CSE-ConnectionGUID: /HQrilY0SIuXnEnXg5HlcA==
X-CSE-MsgGUID: sFrLFQXESd2XvsU5CETx0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="267518410"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Aug 2026 12:13:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuarP-00000000WIu-2BJ4;
	Thu, 13 Aug 2026 19:13:03 +0000
Date: Fri, 14 Aug 2026 03:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 a45d2da30e4138ed6813b721e0d6d4d1160ecdbe
Message-ID: <202608140327.Y49lpB4o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: a45d2da30e4138ed6813b721e0d6d4d1160ecdbe  arm64: renesas: defconfig: Enable basic SCMI support

elapsed time: 741m

configs tested: 14
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha       allnoconfig    gcc-16.1.0
alpha      allyesconfig    gcc-16.1.0
alpha         defconfig    gcc-16.1.0
arc        allmodconfig    gcc-16.1.0
arc        allyesconfig    gcc-16.1.0
csky       allmodconfig    gcc-16.1.0
i386       allmodconfig    gcc-14
loongarch     defconfig    clang-24
nios2      allmodconfig    gcc-11.5.0
nios2       allnoconfig    gcc-11.5.0
parisc     allmodconfig    gcc-16.1.0
parisc     allyesconfig    gcc-16.1.0
parisc        defconfig    gcc-16.1.0
sh            defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
