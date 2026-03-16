Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A63C24E4AF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773648344; cv=none; b=l2AeFJS6vxw/RBFsWawicNVrohElluLXFBDiPaRVRdi4AyPOOMa980ADyq0mY5QoDWbdwPW0L6p9dAbjX7hno6V1996R+RjjZvk5ZnwzkSqGWmgXhUyDQtRROjxKtEg5IPfZ5pVmEZQeYYwJbW7+Sw37ojXEQv3dqoRUzab0e6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773648344; c=relaxed/simple;
	bh=DFwx2uk1MOKu7h22SMEzm4KLIriPxdFNihWefhN/gn4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=krGsPgBbaPesyUg/BEfA5z4W7Nz2Q6rIVt9HDYFybmcWBDGzppP5yEa/DqpWYakD3ueTH3HT2wYWM64J9QTuyWWAATFvvDZ+hWcsc3OjRN2Eh5l664YL44FDa2UM8R0xOcsKfJez2pG1HSuVdzUfNQWNV4vRT8xTNp6REWbyLOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBlrXura; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBlrXura"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773648343; x=1805184343;
  h=date:from:to:cc:subject:message-id;
  bh=DFwx2uk1MOKu7h22SMEzm4KLIriPxdFNihWefhN/gn4=;
  b=OBlrXuraO6PrTmjpll9uyWk4dtx50TgcR/Bz54cgKy9KBVMzVlfK9ZU/
   GtZTxYayHWBPFDVt8G0B/urK4Fv4xgtxGSaf5xMI+eA35GkFG7DlbZqLp
   m2XrjI+CvSynRRiXgT2g35vkV4eA0ksYNVcvVD0P7BwYTRuPb5J3KXCeu
   GRaWYOlGtLmA7CYrEtcm3E541ZMVRVEBRq9o/0nZAfQsNrRr8yuPTKOZQ
   V6b4SySoEBTklYmMsgF4Z7+GqWTai3NeeQATCBQj/9CVbOJf3dPRT3Yq/
   4HrWrHr3p71hle5oRmgJHZn44KnERd9KAgR5xCq706ko2WffKsWF2rQUg
   w==;
X-CSE-ConnectionGUID: CQ1en+O8SEak4wr+yyFZOg==
X-CSE-MsgGUID: HWNuqbQ3QTG/at+yc6hZqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="78507634"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="78507634"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 01:05:43 -0700
X-CSE-ConnectionGUID: +50iMzl/SdufnvBmvMPPuQ==
X-CSE-MsgGUID: VZSn/vnYQv2Ja/ZdNE+1TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="221795148"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Mar 2026 01:05:41 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w22xG-000000000Kk-2IDm;
	Mon, 16 Mar 2026 08:05:38 +0000
Date: Mon, 16 Mar 2026 16:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v7.1] BUILD SUCCESS
 0928a28daf017504e14920f4131bb99e3bc39dba
Message-ID: <202603161604.KdqXYcoD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.1
branch HEAD: 0928a28daf017504e14920f4131bb99e3bc39dba  ARM: dts: renesas: armadillo800eva: Add wakeup-source to st1232

elapsed time: 768m

configs tested: 4
configs skipped: 140

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm     allnoconfig    clang-23
arm    allyesconfig    gcc-15.2.0
arm64  allmodconfig    clang-19
arm64   allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
