Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BAC32E13B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123632; cv=none; b=bEhFe+uZyoW8Go1mVZss+yLQDpZoo2qqzdKemkAETpdrZiehZMCvBpYin89dKMoPa+xWdc9WbxvE0/vIzXf9Kpx6+paKCYGB4uxI2KRwnzrDFbUdNvOx/plQ8hQd7lTEkLU1Ruq6V82lZo9SHKoblDsjwgs7bhBvzj+YiT/STzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123632; c=relaxed/simple;
	bh=tE0B2+23fTF+MXibaCSsnYtnHHN1nGlYKSRZGPL25Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwXRXYwE0EFa35okSPcMU/5OmVD3+m0bWoXINm0WRwEJ2qGCVL0MXRL5pK+nFTp+gx3kPMU9UMVQK3BXCzrpft6VLXoPzW+hS+RBz0jA/Y2ksI1WDL64ua06id03iL4RkJA9pwjgAdEzkwufOe0+uBGUJand9tf9Z0nj55A90/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=gpR9QAJa; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="gpR9QAJa"
Date: Wed, 15 Jul 2026 15:53:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1784123616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8OWX99xuFUxeLzhd68zhsFqF3XUUI5fLjHDeLMdYhHg=;
	b=gpR9QAJa41EOQh8O6CZHq0w9XYT4HXedu0yFHljC3qUkwaxvd0XdNcUHOvXqkjH9Fh51/h
	jwfKfW43d5i7PKF1yfAoO6Xvcy0l2s+XSrdYM3r8GZdlTeMt0BHCBmb8UsiFrCYFbgsgub
	fHN0knp+XeLe9P7pWtkW5S2LxoL186n7dh6U8p7PLzhGf1DXArGQXYYFahJzhz47jwnBxb
	arUgCfooQFgQmQ4GEPq3TXKbVPqACelGRIPLeIeai0zF0cZYzqa82skfaQioiF9T537Klk
	x0XYNTQniUzTK91RVK7QS1RxtsLLKb3OZxhh7i+bjl40CGDBsQ4LqqR0+b/H5Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, peda@lysator.liu.se, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, peda@axentia.se, p.zabel@pengutronix.de, ulf.hansson@linaro.org, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, Ulf Hansson <ulfh@kernel.org>, 
	Josua Mayer <josua@solid-run.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 1/1] mux: Add driver for Renesas RZ/V2H USB VBENCTL
 VBUS_SEL mux
Message-ID: <aleQawQ_RFyqmLbM@pqrs.dk>
References: <cover.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
 <fd55d955abff917123a33842076550dab931b548.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd55d955abff917123a33842076550dab931b548.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 15, 2026 at 12:12:46PM +0200, Tommaso Merciai wrote:
> As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
> bit of the VBENCTL Control Register. This register is mapped in the
> reset framework. The reset driver expose this register as mux-controller
> and instantiates this driver. The consumer will use the mux API to
> control the VBUS_SEL bit.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
