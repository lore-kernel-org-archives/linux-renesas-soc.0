Received: from mail.lysator.liu.se (mail.lysator.liu.se [130.236.254.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1234369D61;
	Thu, 13 Aug 2026 10:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.236.254.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786617504; cv=none; b=GfsjIQLeTRh/ic/gQuPgLvioiF+87BHgB4CP7+DVMOgDSCB6PIz1STX/iaVHIA8zL6jkTT1ZMsW5N/0E6O+ONAFA6Eq6hCUXlgUsp6yBNDup5qxaxILAg/W76EXHk0mIw6R5ThgBxEyDyLeQuZDy6us2PgilhUFaM3gZRxKScME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786617504; c=relaxed/simple;
	bh=BDmDaCzLWn7hbQOlCuNMNhQE9k4Vf68xj+Q6TZAltYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/3+WmzOvFAEHyYBt1StIV28h+kQmwdaglAQFOFnakqccTF/8IW0VTfcSiiTfN3syggA50AZSKb9z0SP/CbfriTrjLc4wuwx2IZgmGoarTdolYuNG3N1mvNwagmeFUxPjnq+XtghuG7BYf/3KbPdgV2gLyj26cEHTK68JdIc1Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se; spf=pass smtp.mailfrom=lysator.liu.se; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=RvgKDd3Z; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=RvgKDd3Z; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=FW+ItoLU; arc=none smtp.client-ip=130.236.254.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="RvgKDd3Z";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="RvgKDd3Z";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="FW+ItoLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786617492;
	bh=BDmDaCzLWn7hbQOlCuNMNhQE9k4Vf68xj+Q6TZAltYA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RvgKDd3Z8hfORRFc23NXJ7QwlF4tBHYO1Y0jU4IO/ahxztlVvbZ37agbO31C8m7r3
	 v6GUs0XtaBXrVlrtSXlqzEoSP3vvNp4UJ2qa9KUpmeMqhUh0I8BLDflTVu9zAuSh/i
	 UPX/+as5CoFZbi4SHe6RW57dogezO6FYXsNCep9D9kGI4OW4OPwP7eVnHDQ95zH30U
	 9l1uv+73oErZH8aJkTIBVEGF1fZvtVhrowsEuesGiJ3dEDIEwbDw+3VD9Et7kEIJrJ
	 WQn46jQ9EMqZO3AZVDwSyILkPiizk9KDGBB48u3YtnHbwLQ1LtXgn2/Hd1Vojz6eqP
	 b1ulAmtiif4CA==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id 354DDBB77;
	Thu, 13 Aug 2026 12:38:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786617492;
	bh=BDmDaCzLWn7hbQOlCuNMNhQE9k4Vf68xj+Q6TZAltYA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RvgKDd3Z8hfORRFc23NXJ7QwlF4tBHYO1Y0jU4IO/ahxztlVvbZ37agbO31C8m7r3
	 v6GUs0XtaBXrVlrtSXlqzEoSP3vvNp4UJ2qa9KUpmeMqhUh0I8BLDflTVu9zAuSh/i
	 UPX/+as5CoFZbi4SHe6RW57dogezO6FYXsNCep9D9kGI4OW4OPwP7eVnHDQ95zH30U
	 9l1uv+73oErZH8aJkTIBVEGF1fZvtVhrowsEuesGiJ3dEDIEwbDw+3VD9Et7kEIJrJ
	 WQn46jQ9EMqZO3AZVDwSyILkPiizk9KDGBB48u3YtnHbwLQ1LtXgn2/Hd1Vojz6eqP
	 b1ulAmtiif4CA==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id 0BBF5BBFA; Thu, 13 Aug 2026 12:38:12 +0200 (CEST)
X-Spam-Level: 
X-Spam-Score: -1.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786617487;
	bh=BDmDaCzLWn7hbQOlCuNMNhQE9k4Vf68xj+Q6TZAltYA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FW+ItoLUw2QWh2iQtS8+nmSlc4wNgAsKqi8mOvhRl9537mTpB5+0e4nbZ2fi5N0bz
	 wL/sIHUMCPlgd3OhBqJNw6GpUcZ3omY8c/4AHK2j4kolzBMlHS4148QehFJbRtJtUg
	 Uj7jD0rbqG43uDn9Cs1+PthwsMK1HPb7PAmBScLPbtJCaWxtnWVdtjCGHZB8KwpN06
	 KaI3Zw/0NFI8QkLM7asZwj1QlSJ0KNZEF5SbWHSpZFJl5+aE8h1Jy77Ei8IaB0QIzZ
	 8mbmAisFRdjn80Uh/KnEP7EXagXAybYwCVfBz3PFq3yuTi3llrgLUPVg+y50zjWBCt
	 yZnEXZugNvRTQ==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 259AABCB7;
	Thu, 13 Aug 2026 12:38:07 +0200 (CEST)
Message-ID: <39f7e422-a629-4ac8-922d-ec47eb7d838e@lysator.liu.se>
Date: Thu, 13 Aug 2026 12:38:06 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/1] Add USB2.0 VBUS mux driver for RZ/G3E
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 p.zabel@pengutronix.de, ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Ulf Hansson <ulfh@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?=
 <alvin.sipraga@analog.com>, Josua Mayer <josua@solid-run.com>,
 linux-kernel@vger.kernel.org
References: <cover.1786347402.git.tommaso.merciai.xr@bp.renesas.com>
Content-Language: en-US, sv-SE
From: Peter Rosin <peda@lysator.liu.se>
In-Reply-To: <cover.1786347402.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

On 2026-08-10 09:51, Tommaso Merciai wrote:
> Dear All,
> 
> This patch adds a new mux driver for RZ/V2H USB VBENCTL VBUS_SEL.
> 
> All patches in the original series ([0]) have been merged except this one,
> so this is just a follow-up patch to add the mux driver.
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com/
> 
> Thanks & Regards,
> Tommaso
Thanks for your patience, I have added the patch to the mux for-next
branch [1] and it should show up in linux-next when next is regenerated
(usually within a day or two).

However, it is now too late for the patch to actually hit the 7.3
merge window. I will feed it to Greg in time for the 7.4 merge window
instead.

Cheers,
Peter

[1] https://gitlab.com/peda-linux/mux

