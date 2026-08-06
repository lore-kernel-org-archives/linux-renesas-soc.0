Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF143848F;
	Thu,  6 Aug 2026 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012128; cv=none; b=o4Dvs6KtM1luqMlQblDFFAwvpX7o4sTR61x7CrY/DosIr66zWZKTEyAci8XXcXED50Gp9MYye1gW381Lb7j6QijqTW4qnfoH3gqweQ89+TY+9U/3yOJZ9FFtgpcxH91QyYobvLdzdD1Sa8dGXCuTixj9lfDG2i+QXpGRdgIFNBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012128; c=relaxed/simple;
	bh=LXW/t29hadJf6urvNb1g3f0bS+CG0klslPQb1HlLU94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bco/Lfa5J1GcCNHTvXwyaUzbT3PZKNX9e6xPlMoZljWlFBJHF2oVkTwO4b7e+tFwhrt/WjpF86J+Y9MidKoUwmslJgWPoi01Egtb+n5obLJWd5vmjlVczAJ7l+7NA0wYcepVhCG/aLpUFBTmarQY2uPHv+rBde9pXUF+tmdeZEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXaw8+oi; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXaw8+oi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786012126; x=1817548126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LXW/t29hadJf6urvNb1g3f0bS+CG0klslPQb1HlLU94=;
  b=AXaw8+oimrojeENlaY1Y01PQpinDOQJYdo2o9ibaFTr9ABts4dDxXDin
   9SvE2rImHf/+Xk+Mof2tbG4ea0W3+a0DVY0tKg0LazdGVbOlMY7uwBAEP
   uqSxNRJ1iklON5zK9PphDPmQEn6sU+zHPpqUaldVd5NkLsns62HJlXQ2B
   VActqPOiQfnYTkIxliWpeUdFCULfmU5XPbvpgEXwJIYEzPAYbroAM25R7
   uxUogVBN1LF4C1RCHDciPJJb5Tm40fEx0Up1tw7FoYj4Q3d+gF8MmuMQY
   E4uzYGlGMM2RCMUr0iMyd7CSwkDbve+yyCOu+bQ9QRx5HBYmX0SJN7KfK
   A==;
X-CSE-ConnectionGUID: 6r78HdApQo+YGl9ImMpF7A==
X-CSE-MsgGUID: xpIt6zDJTaywjvaK9VkgxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="89124231"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="89124231"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:28:45 -0700
X-CSE-ConnectionGUID: Vxvsf1ajTiygCLQkGR376Q==
X-CSE-MsgGUID: IR8QoaJtRh67VkoiJuiazQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="257765726"
Received: from inaky-mobl1.amr.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.225])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:28:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8AE48121C0F;
	Thu, 06 Aug 2026 13:28:46 +0300 (EEST)
Date: Thu, 6 Aug 2026 13:28:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linmao Li <lilinmao@kylinos.cn>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: rcar-isp: Fix VSPX reference leaks
Message-ID: <anRh3g4AoDpceIJ6@kekkonen.localdomain>
References: <20260804102431.273385-1-lilinmao@kylinos.cn>
 <20260804102431.273385-3-lilinmao@kylinos.cn>
 <anRUpYHq3uEl462H@zed>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anRUpYHq3uEl462H@zed>

Hi Jacopo,

On Thu, Aug 06, 2026 at 11:33:50AM +0200, Jacopo Mondi wrote:
> Hello Linmao Li
> 
> On Tue, Aug 04, 2026 at 06:24:31PM +0800, Linmao Li wrote:
> > of_parse_phandle() and of_find_device_by_node() both acquire references,
> > but the ISPCORE probe never releases them. The device node reference is
> > leaked immediately, and the VSPX device reference is leaked on probe
> > failures and on driver removal.
> >
> > Drop the node reference once the platform device has been looked up, and
> > release the device reference on the probe error paths and in the remove
> > path.
> >
> > Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> 
> Thanks, looks good to me!
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Sakari, Hans, should we collect these two patches as fixes for 7.3 ?

I've picked these and pushed these for merging.

-- 
Sakari Ailus
