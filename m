Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1630C372
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 05:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775798878; cv=none; b=H4UlAqA2CXQI2kJ/RoQqBK7CV6f+EdUQHCFpODOco+9IDQkN+aqFZWoKuuESuynlXBmedUIdpDYS3P5G1UuqEetxTUc9fM5eNBdcdE03dnu2Fo4xXd35RjYP6ssoJf+p1yR44dHuMr9/XDh8fIU6UNE5CD4xo+CKWCGxC083Tfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775798878; c=relaxed/simple;
	bh=brWxWAEWV83fdekCQcetNGlEbink0WMdXxS2xDyQDCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jf+YLGClLcGVB0lR6tdcO1VR1Bd7BnetnST5yphZB0GXKcQfyYcpyWAznJsiY6Cmerxbz8OZGPoP9f3UhyC2M13+wHHXU9CNQT/Hl2YMKnCAJCe7Qchb3ky21uHggE7XTWJ1JL+Ao6lKByA14AR6XfG+fMT8qc41uI5hAg8j/W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Azw85VCH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Azw85VCH"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42E37348;
	Fri, 10 Apr 2026 07:18:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775798330;
	bh=brWxWAEWV83fdekCQcetNGlEbink0WMdXxS2xDyQDCc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Azw85VCHgDNZFuS0Q5cj46c0WgbxjY/WffG2NMaAWQf9oT43PnMiG/FdSESK+QmhY
	 BIkS6AaL/EyZjeOHF38ZpYIULsBMMQnJLB6jSzfbeiEpPiofOih72wZO6+qBeN8f7R
	 5wyhp6gJq9pxzRwhdOfh+1ouYx+4WcnPVpeK4E0Y=
Message-ID: <9d2f6113-bef8-46f7-a989-4003270c8f4a@ideasonboard.com>
Date: Fri, 10 Apr 2026 08:20:16 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: rcar-du: Fix crash when no CMM is available
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20260408124205.1962448-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20260408124205.1962448-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/04/2026 15:42, Laurent Pinchart wrote:
> Commit 3bce3fdd1ff2 ("drm: rcar-du: Don't leak device_link to CMM")
> refactored CMM handling, and introduced an incorrect test for CMM
> availability. When no CMM is present, the rcrtc->cmm field is NULL,
> testing rcrtc->cmm->dev causes a NULL pointer dereference. This slipped
> through testing as all tests were run with the CMM present.
> 
> Fix this issue by correctly testing for rcrtc->cmm.
> 
> Fixes: 3bce3fdd1ff2 ("drm: rcar-du: Don't leak device_link to CMM")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/dri-devel/CAMuHMdXomz9GFDqkBjGX9Sda_GLccPcrihvFbOz0GAitDVNTbw@mail.gmail.com
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
Thanks, pushed to drm-misc-next.

  Tomi

