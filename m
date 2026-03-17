Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E293AA4F2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748314; cv=none; b=CIh/oJehlr7Bkt97EDYLWTDL7bPL4jxDQb9wdKSK3mdVNeqfKE8CT0oTi2isF8m4e2tbNcuax0IBYsva88xqEPa+0tAKEerkgKb7e0YF7hRtbZ47tSF6wvl1GBraX/VPtMC1CNbDc5SHTzC4EYBXeV0rAD+LGPXB8Ot9FEeJK60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748314; c=relaxed/simple;
	bh=M9BPMcEtgzE/ZoXXK1hD+SPnwCTYq/7nH3xcj025TS8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IpqgOeATlxg9BFSG4mXbej7zlnLL3NotrM+n7SRJ0vRzZ166xDy4DsMEDv+q6XZfK6ymzb9q92bJZSizVJVhdMXMpn4qZAnTg8Y9ujniT8rXi9tUFiVhae2rxAGJzLHruG4b9oQGb+lKNlTTkLO0I1OlKvYzeaAMspKf7rO1ybc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7yeybey; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7yeybey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773748314; x=1805284314;
  h=date:from:to:cc:subject:message-id;
  bh=M9BPMcEtgzE/ZoXXK1hD+SPnwCTYq/7nH3xcj025TS8=;
  b=n7yeybeydwCtwHUCtRE99F/edGvM4Kbo9zFHnRrf95fh5oFUvzbxMHUQ
   RutZ5oRLevY+irNHpKuUFPfYJ/9kh/rYsceG2h/M9xx3IidhJULboTdMq
   RXtL1w4hcwt+O0oNkWo6x67rDFaX8K3zdCAx0GzxTUNpbqZcoPvpi+Uge
   or9VwqJ6V/jXhRTgDIK9yjBAY8vH/AgZUlQqN9jTLCX18BgVxy3fNnXGu
   ixR8BuRtEZ6RDtSysSmXmmwFOyuLXcwMKI+PSNd3xPpshJwQkfcycHVp7
   2HMyPOzcpMIOBB8zfQewyzpazF0Z2+0oQCx9Y0kvsO6ha52tcsVytFCI1
   g==;
X-CSE-ConnectionGUID: K4tdrEneRS2pd2RFdEZjAg==
X-CSE-MsgGUID: rLJ9zcDlR2CORHVsb4lvMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="77386876"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77386876"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:51:53 -0700
X-CSE-ConnectionGUID: dJVmDspbRJqJNKLJDlfcHQ==
X-CSE-MsgGUID: q/S3kWEORxuSdAfGKHO3lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226713193"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Mar 2026 04:51:52 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Sxh-000000000LJ-1ZqR;
	Tue, 17 Mar 2026 11:51:49 +0000
Date: Tue, 17 Mar 2026 19:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-soc-for-v7.1] BUILD SUCCESS
 d784bbad7fcbfad42e0d12c8dae2eb9c17b327b4
Message-ID: <202603171940.2KJPt22M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-soc-for-v7.1
branch HEAD: d784bbad7fcbfad42e0d12c8dae2eb9c17b327b4  ARM: shmobile: rcar-gen2: Use of_phandle_args_equal() helper

elapsed time: 1519m

configs tested: 2
configs skipped: 212

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm   allnoconfig    clang-23
arm  allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
