Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D3F2C028B;
	Wed, 18 Mar 2026 19:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773863224; cv=none; b=T+oPKFuV5Gwds+MBRqRstMGh0kK6e6nNwyR3tahaI4Z4hKgVp/bmizbo3j2feaVikDA+dDSLRhBoAVdUVaRV834OSOKp379wRY4xcutRGh8RjQalxxx+vZv+6UuTqRUhzNxoSfMRXFPnVpVPhvNbmyZKWWYnxCpfwxJB1MrW9gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773863224; c=relaxed/simple;
	bh=zGoPdGrpmQ75VyLpAvquLe7fjUxWw3n+CXFih6clnvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3gl68FJnupVGaoBa3VyYiWSKwgu5mEzcRmceL/vqNOb26LrNj3ESQOJ09Hcu1jkVByfg7vqK8A8uNaeT490b3FzpoiiTot4gEcBMVWASR23HYsuPWg5w4XTbUzELvJRzoyGnXzQW9xoDVteP8pJxth3YwYgTQH9f+YEiLCxT9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aGlX6pST; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aGlX6pST"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E6C75308;
	Wed, 18 Mar 2026 20:45:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773863148;
	bh=zGoPdGrpmQ75VyLpAvquLe7fjUxWw3n+CXFih6clnvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGlX6pSTiRnUtdfqR9H/39ugHP98xKnEhfFZoODyS3U7GFk4QLKKLMC1oETjSdQMl
	 MtYoVr2LwM9YTDibAGbbIv76FszDtdbPkIGvm3J7wOQCCm5cOT4MnAVQlTjFgWG+tt
	 mEyOYznXRB8m/JnZJqRWDj7YOZ8QAwnvq4liOWiY=
Date: Wed, 18 Mar 2026 21:46:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: renesas: vsp1: Fix NULL pointer deref on module
 unload
Message-ID: <20260318194659.GE718539@killaraus.ideasonboard.com>
References: <20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com>
 <0a8c0467-04f7-4b8f-8988-cb5665ca1d68@ideasonboard.com>
 <abEwF39-dSVPWVAb@zed>
 <17915103-09f7-40a3-8330-dc4ecb6c3bd6@ideasonboard.com>
 <abEzNDElf7b2JVaQ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abEzNDElf7b2JVaQ@kekkonen.localdomain>

Hi Sakari,

On Wed, Mar 11, 2026 at 11:17:40AM +0200, Sakari Ailus wrote:
> On Wed, Mar 11, 2026 at 11:07:50AM +0200, Tomi Valkeinen wrote:
> > On 11/03/2026 11:06, Jacopo Mondi wrote:
> > > Hi Tomi
> > > 
> > >    I intend to send out soon a series for other Renesas components
> > > which shouldn't be controversial. If I can get tags quickly I intend
> > > to send a pull request for v7.0 next week.
> > > 
> > > I can include this patch and your other one which I don't see collected yet:
> > > [PATCH] media: renesas: vin: Fix RAW8 (again)
> > > 
> > > unless someone else intends to handle it.
> > 
> > Sounds fine to me.
> 
> Both are already in my tree.

I have more patches for vsp1 for the next release. I notice that your
last pull request was just one day before you replied you took it in
your tree. Will you send another pull request for v7.1 with this patch ?
Otherwise I can include it in mine.

-- 
Regards,

Laurent Pinchart
