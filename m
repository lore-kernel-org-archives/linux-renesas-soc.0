Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8333D905B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 08:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601695; cv=pass; b=ikvJz6zHFMRCiXzEQnlxBIz5SmaI+AuXRgiB19xvlSpQ4ZRSD0cfSysX/Lgy7j+IfvW4ww1o0DDyL9lDQh8+HjiMIrO5lSIUVK8YEGo1iGZIeLvwiZ53jk16Rt8YCQJipq2tyQfHba8wOHHA/xuPa1PRsSx7vx68qL7jYR2EvfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601695; c=relaxed/simple;
	bh=MwThOBBWpOkDOYWcemxNkAADMr8JVsWmiEoxhZfNklQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eo7bPHlfyn/ARszXyf/eIomI9PNUPDqjXdQu182mZiXNpGKdTrOem/Tw+lV2EIJptLhEpqXx3VN890im1jHCLqs1m12vYPFG/x6+MzF6n52bHRWUXe6MSlNZ0nwch0XXvePW+GbG9lT1crsTc8Cf79faG7FWngXLfo/xFKK60DI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mndisT7g; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mndisT7g"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56ce54c8c82so705026e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 01:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774601694; cv=none;
        d=google.com; s=arc-20240605;
        b=amHszC/36AXfslFr6lOGbypQX+7tRujr92rUeOT007pRnIMzTtidFkL72VgafekU6t
         M/Qx/CYIVr/nZK1hZ0/NoYpIjZd3rID57jjDmvLOkuYy+zdBU8e4BMvUmfUmRLIyDTiW
         wtB/6cR6457PQiKLmLhHu5R3lZ5Cfl0hSC1/oG2E6Pe4zYAm4yrAq+SM0C2C13BhNLaz
         jwg2293NiEpeHhZ7dZD/vR7UeSYRL/y2bhcLWie6O0vnavM2tsvVL4XPe78IbXLeOvV9
         bcxcn9u6G3sJmIeVOoXjZUH7G8hd4DFgsiDFUjooBFXqKnqKmxW9AvwoOQw/2NOg5o4H
         rD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T7/LugWtiulNbRqHbjrDrHDNUr/Kb287tL6XhNh2/Yo=;
        fh=JhumzE/pKIJkLxiMhfT0P31B1lqJpJk2Q6F5aMw4JaQ=;
        b=F+yA0CwWtsdeEIIBxjzKfUMO06lmd7f5TX2G+dNjg4GQzpv5bJAfJb4WcrmgF3Hd8/
         Hy/ebeFdEO5FbTbw1DecqJqY+E+hnPpXm8w4OhckdyeNDZZmp4O3yBg9z3itT+tgmMfb
         RLPW3+mZ9qxran+tPSqmYkHZ5Ez8XTVeP2gxlGo4e/zyxRxl0+TaD4dV/oPUc7krkbP7
         ShnuQnUQHkilEdHTHN227YayujI/C4rbzQj9A9Ufrsib/Q0Uw1V7phHJBrQg4thSCXgE
         HIuWrO8rm9B+DvvJdYG9tvF3ZE8n+B1/7amiEyYRzcjGIVeYFaV7WqiITzKw4jSpkJ8f
         gkAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774601694; x=1775206494; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T7/LugWtiulNbRqHbjrDrHDNUr/Kb287tL6XhNh2/Yo=;
        b=mndisT7gcNpS195MHQFWp5PFuxANnlmtOytwsMmVSr31mJFwen8Jc3QmfvatMut2zi
         dxRPIjvfR4ppawRe3BsEpdZqfmciK70p8RaHCt7rbfNqEZ4ad1dFekfpTixJUumhGcvJ
         fPExCSBlpHaIAQ6Gst8yyZbZ6Td3GxwOp04aHzLug1CSgk52SWKQJvYLf0iHUTn7g337
         WGuuftqk0uKJL0HEVmsVjimMce3XHuduHOWK1LybHcm234S/uJ08zhTErvaHnJ718Z+B
         DxqaxSLJxSu/NpUBz+uyrgfffpv8yZIF03P6mqDUh1Kqz3tCguyifHW2QAGzpBcOIaCY
         lLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774601694; x=1775206494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7/LugWtiulNbRqHbjrDrHDNUr/Kb287tL6XhNh2/Yo=;
        b=i1VpTF591y2PpOEOuA/OcAm1CM7k7pUXJkfl4SJ0x8k1kfhBF9L2b+B8jMpE3fLeqr
         gfh5GhTTkFQXiP+ppjIQ2VW8H7oraiD8tm9nQwKWo/GWJboQLQM7jB70d0MlnKTKtMls
         H0l0bZddAAMn4ETtYBPvYX1olIZvnkBlKt3jLL4CCtEMptmw6dmcstgU4a+TYjs4jBae
         fP+0FjM0yX2oR4HHUrC3F4dDDGEbrz7XDa7mTn6miK4bh0o5hchhv9kyKGMput6CxdwH
         aUE06Y5aK/Qb6iz5j+OIDwRBrdzW0aFvkA3de3ftE55slCwvxh975zce/DIoRq7CFtSd
         roAg==
X-Forwarded-Encrypted: i=1; AJvYcCUxlCzAlhFJOPGILi/QnoEWNiWvWTtwJwX1m8u1sZA0RxBFBiFi71BTBq8kQvWWs8jzG+/MMOWFU+e0b2EOtbFFuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyiWXVUYxLu1dEa9TAvKWMLr5PB74BkP0Vf//eXQtwA0Piw3wx
	Ox5uqbP2W1jQ1zTVsUtRlTSkIihFAAN/ozweUMtH6hmfCiX7bUsmtZOpyY5pOvmyXcmhQu003C/
	ix4k4u0FNm4PfBJVKdA7KKohHjs9Naxs=
X-Gm-Gg: ATEYQzwGl2r5F7vqDWRPXNFkVI+wjkNO1NcrkyPGxAdMtcUDy+EPBD9G8d6pUKtDIdP
	Up2/l7bDPQdyG71JFCBBwwhWGzh1LYHa6Q12OUEhZZRTeulXlhhPIDLXilwRAjTmiUWiYEf8LZT
	gJgiVl8sOSsYr1j5CODWYUqtVWk+vw6Yuy+IiSHvnlHwC0oAe+iwQNpidu9DMfjjIrcnGog55UO
	svXFpzqCER3gK3Zc1IOEQE2tgunyAEqciVq4YF9Dz6Rc9nrkSVsZWJ59/ozF5t0BvGYkvTWvW96
	YVDTTbGH
X-Received: by 2002:a05:6122:e202:b0:56b:da56:b261 with SMTP id
 71dfb90a1353d-56d4a4fb92amr503443e0c.5.1774601693586; Fri, 27 Mar 2026
 01:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-bridge-v1-1-c0c44b53f7b6@gmail.com> <DHDEL0VTRYDP.2D45EP8E07Y08@bootlin.com>
 <20260327083404.GA2993961@killaraus.ideasonboard.com>
In-Reply-To: <20260327083404.GA2993961@killaraus.ideasonboard.com>
From: Amin <amin.gattout@gmail.com>
Date: Fri, 27 Mar 2026 09:54:42 +0100
X-Gm-Features: AQROBzDFlUzYOMqDS-iqKRxv8JNsRUoTNReh_7bD9RMr7xj5BSJFZudRHBuQdZI
Message-ID: <CAHfa7xXeRaGw1ADFsuT2dcqkY+KXb9w_vi4tq8G6ehOS9r7cAA@mail.gmail.com>
Subject: Re: [PATCH] drm/rcar-du: Convert to of_drm_find_and_get_bridge()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

Thanks for the feedback. I did reference commit 7282066e55347 (Luca's
earlier conversion) but I should have been more cautious since the
patch I submitted was a bit too simple/"dummy".

To answer Laurent's question: I did not test this on hardware.
I was working through the deprecated API TODO  list and made the
mistake of treating this as a simple find-and-replace.

I'll send a v2.
Thanks for the patience...

 Regards,
 Amin
