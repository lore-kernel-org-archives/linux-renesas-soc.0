Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599F13128B8;
	Thu, 16 Jul 2026 20:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784234643; cv=none; b=FmRpYDv1Diz6a3W9aBbDlYBuQdcBmPTFyuqB3W7uluhL8fEAm6o3QCKpQAfdrGqJSut/l+qbL+RnfdO4xldbvd/7r22Oib6dyyInsJpibb2b7L1ecujIrD3s72LYhN18Pgi7XoogxEcE/SkaNNUFPT+FgOEUUIIafHWJz/Xfs9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784234643; c=relaxed/simple;
	bh=mUftzrWBK5bHIAIlg6Om3EBbYQ3fakGuxSLufZa82go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yb9esQJaiZfvLh2K+xptfC+n0U+1mwb6tZ38tgqXeKD0Q3k9TZZOKRWG9V1hWR/fDx9rQzStCRSUXiArkfuY4RRPnnDTY6teiE6zYLh+fgu7DL3oV+bHSgIWgxpaOKzdnztzR0e2heJJKIFDATtGGecpwKD8huen4dyOP6C7lBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zco0BAv7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zco0BAv7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19C81F000E9;
	Thu, 16 Jul 2026 20:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784234641;
	bh=ndiUnTv+f5gzNuW74iwaWREcbUrCZddvl6t+J/D2k5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zco0BAv7DEDZe/+tNjWKWcuitAbYkU1Skvu3LNjUkaD8HJVt+7Sh6T712y4OB1jwT
	 tj+H9/MQU6ZnkHt4TOSkSv0kh0XlzlkRSb46MvG0/S/BfNGKTm8TOMHF7fe7zU4QyG
	 a1YvISgEOIg/OmXHxBlGbEDfzxVyf1YcKOneBKRNrz0M1KevXaGd57YZ77p2dVd7vf
	 AcVkm59gJHAPNO7YTiWwsRzqSjbZYv7VMTxp/PpFUGJSIuNA1wlNPzqVcldjLkqCdH
	 SNdVQEMR+XAoLgBhJDMC7jQQVtg4e+gyOOhO3q3tPzxo77tm4GInYeGxRTe7hMdFRk
	 IqfdNIX3BtTFg==
Date: Thu, 16 Jul 2026 15:44:01 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow
 hardcoding EDID
Message-ID: <20260716204401.GA1209579-robh@kernel.org>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>

On Mon, Jul 06, 2026 at 12:35:39AM +0300, Laurent Pinchart wrote:
> Since DDC version 2, introduced in 1996, VGA monitors have exposed EDID
> data over an I2C bus. The bus is also used to detect the presence of a
> connected monitor by trying to read the EDID data.
> 
> Some devices where the VGA display is integrated in the device and
> always connected do not connect the DDC pins. Some development boards,
> such as the Renesas M3N Salvator-XS, also do not connect the DDC pins.
> 
> To support those, add the ability to provide hardcoded EDID data in the
> device tree. This is mutually exclusive with specifying a DDC bus, and
> can only be done when the VGA display is guaranteed to be always
> connected.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../bindings/display/connector/vga-connector.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

There's already 2 (.txt) bindings with the same property, so no issue 
with adding it.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
