Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A727410D26;
	Wed, 25 Mar 2026 18:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774461689; cv=none; b=JPNHXUo6lLflgUPntyjYlPunc2lG+1u5DhqvbB75Sw9zyY6OoRSIiwb6an5DGVuDWEBdrqmUKk5RuOmG5iERYoOD9eU0xbkXttL0NbEGAq0ieH+/VEXKbKHKLHTJbw16mWqA7Hn0BiHS2HwRGSrkS3/puJ0bpfumr4AOiXWT0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774461689; c=relaxed/simple;
	bh=cxcEiJdSXDYsfGZThFrx8z5QCeSMFqgQ2jFvleh78SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+FlcpD8AZGq1Ql6TfsxzOMW1whRdGj3xy7L5dw6oqju0ZEPfJV+uqNzGyJhTgN/8WSG6A1qs5FA1HJh+Q5aZ7Mhbv2sJON48B1uGMGR5rULQwmxDE7TaRBQHLp/uqgFHAgDbXa9QUtXvo3pZoGjMw4PH9wayMbP+WmWDX1LdKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8yRfORe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8yRfORe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774461683; x=1805997683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cxcEiJdSXDYsfGZThFrx8z5QCeSMFqgQ2jFvleh78SM=;
  b=V8yRfOReB0s7i766sFZvhl6r7gQkjyE1KosZnCXOO0vhtUT7/TsTtAcp
   wdjV5THdmI6wP4A+OPmljY73QDLX2T3dGn/ypcPbYqLfrKA6IcoHlxlmn
   Umkaoz1DXqrz9Y97v1M/SlpbOC+oxfZLaV4/hdITE2ytE5ab6gNgqEW1m
   OZgxpWXTJ9cgS2wCkkGxMGkAIitIrWm6R0kjuGnkx0A2xQw/e7usqYtQg
   nqDycY6ceoizY41dvaArMKCuoSjE8zzPEwPxqMCZuvq2L/LG3rPN5+aE2
   23rsCYXDncnaz9Dpb6GvBSmGk4IqBoMMIFnlgQu5jT/6RdFgFlZOrVnKv
   w==;
X-CSE-ConnectionGUID: CJQ+Chi2QnGmOb3CtCtJ1w==
X-CSE-MsgGUID: pqmEgJcQRA2F+oX5kMsIeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86203066"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="86203066"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 11:01:22 -0700
X-CSE-ConnectionGUID: t08BnS/VTzyDBNZ6Tq8yEA==
X-CSE-MsgGUID: BgBm7Q4eRg+ods3OsmAh+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="219914689"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2026 11:01:20 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5SXd-000000007RV-1s1s;
	Wed, 25 Mar 2026 18:01:17 +0000
Date: Thu, 26 Mar 2026 02:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Biju <biju.das.au@gmail.com>, Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 15/15] irqchip/renesas-rzg2l: Add shared interrupt
 support
Message-ID: <202603260117.5j4fMpip-lkp@intel.com>
References: <20260322122421.132474-16-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322122421.132474-16-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v7.0-rc5 next-20260323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju/dt-bindings-interrupt-controller-renesas-rzg2l-irqc-Use-pattern-for-interrupt-names/20260323-002740
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260322122421.132474-16-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v6 15/15] irqchip/renesas-rzg2l: Add shared interrupt support
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260326/202603260117.5j4fMpip-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260117.5j4fMpip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260117.5j4fMpip-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/irqchip/irq-renesas-rzg2l.c:111 struct member 'used_irqs' not described in 'rzg2l_irqc_priv'
>> Warning: drivers/irqchip/irq-renesas-rzg2l.c:111 struct member 'used_irqs' not described in 'rzg2l_irqc_priv'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
