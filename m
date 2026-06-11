Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB7E3BF69C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179038; cv=none; b=OSliSQsgidy+YldVPJzHmGL/L7y8fhvJ9/F9qWCmOotT+1yP6UJNDiiFmToGjwC1DD8JKwdEvXjqa45CT6nyuO3RZ2nT84AX7lTwZ64Te9+lp/r9hzy1gYk9xGqOo3QEL8F2TQcYFsuHzkfoEjIk23waPrjG7L8haB7xwxiRLiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179038; c=relaxed/simple;
	bh=GayVEXmjspQCJ2oKuic7KfnIc/ANvTHDE1M6PULQaTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEe1FTkFhre/XTKVt8d8G+m8oM/iiiRI5yQYadcMZn/BWEVaiQ3CdrzD1BZI9C5tRDT6+gn21jqxpgA4Tw1siE7bQdIxlAsJnZdbMys40F1wflXWVEM85KftKSNhLzKwBgC3FRMHzIxX+ZVJ8SDo7w2jnHOScZnNWPzBk2iPLME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oQDbrg9V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oQDbrg9V"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48A2F497;
	Thu, 11 Jun 2026 13:56:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781179003;
	bh=GayVEXmjspQCJ2oKuic7KfnIc/ANvTHDE1M6PULQaTU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oQDbrg9VRiflCx4NQDPol/QNPs421dw5QYBIOkR6UZ4k820yrSWkT/pWDJ/wasY9n
	 0w/DfxgU7MFVB2sB4RfczbIKzBOaq8JpIZklovpWkErcOFBT4kSSm9CEvCxeNehkNS
	 XhvrbpBPRSOQ1xyu51apoWO7ZuGYAMPV1gGu8kds=
Message-ID: <dc0b6669-c7b3-42a1-99fc-c7850ac69abe@ideasonboard.com>
Date: Thu, 11 Jun 2026 14:57:09 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rcar-du: Drop superfluous spaces after assignments
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <80e30578b6dd86664112320616c460c48dbd79f6.1777881435.git.geert+renesas@glider.be>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <80e30578b6dd86664112320616c460c48dbd79f6.1777881435.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/05/2026 10:58, Geert Uytterhoeven wrote:
> There is no need for a double space after an assignment.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This started with two instances, and got copied each time support for
> a new SoC was added...
> ---
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 20 +++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Thanks, I'll push to drm-misc-next.

  Tomi

