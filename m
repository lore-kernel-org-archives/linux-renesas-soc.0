Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC86047F77F;
	Wed,  7 Oct 2026 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368940; cv=none; b=fpSUIs6vixw8NIaE1Ax+7U2JY7Z/u0csmPLC3dcQk+vOdxlhLXmy2kpOtNt//5Km1eiKKTY71iMV1pTepo+9jB8NWbPrnltRDuS6WML84c77oDh8T+LMJSrSWW+5G13A3+GFcJlVeHNie2gUuFiY4vfLNGeAQMNXF33nKCBJsIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368940; c=relaxed/simple;
	bh=weuBvweQFZVt/7mS7Fc95N/a2AlwcIYomOHyPpIYkUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkBFYwRS86nP3Awwxu2V/Md+iaoWlzK1/FVzXbARkoAf8eYtnL8r9ficSyAC4JwIr4/3NYIMLPF98piJus5A3JEzRW0AolTLXBd4u16eosgpjkcDjfqIZXMS1bYwqvHPUcnBbAkGH1Ab8AiYitdJhL2pymwMc0DB6wGr+1tVZek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sAxtiXM+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sAxtiXM+"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 336201494;
	Wed,  7 Oct 2026 12:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791368805;
	bh=weuBvweQFZVt/7mS7Fc95N/a2AlwcIYomOHyPpIYkUY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sAxtiXM+kPXP9eOSagM8GbX9NBuru7NkPy9Et0DiMeTUz7aXf6MmZ0jzFEYfmi2zH
	 t1z1kcCavBJ6tWWJLLf2wYktu7hrB/312nhJ1kpZInpw67LgAU334nxEU9QdTUMS8o
	 co6LO9BEO7edkyEKXfFy7tEDz5SxCEIAEcKlpO84=
Message-ID: <6e22143e-92f0-4611-90df-9d1674083cff@ideasonboard.com>
Date: Wed, 7 Oct 2026 11:28:38 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
 <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
 <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
 <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com>
 <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
 <CAMuHMdVMt95DBV1DeLa5zVkMV4sYj8v_uA1TTJiZFi_QKvMkAA@mail.gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CAMuHMdVMt95DBV1DeLa5zVkMV4sYj8v_uA1TTJiZFi_QKvMkAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert

On 25/09/2026 11:10, Geert Uytterhoeven wrote:
> Hi Dan,
> 
> On Fri, 25 Sept 2026 at 11:48, Dan Scally <dan.scally@ideasonboard.com> wrote:
>> Huh; not sure why I never followed up on this. I haven't touched the board in some time, so it must
>> have slipped my mind. I can pick it back up and address the comments, including adding the other
>> interrupts.
> 
> Same for "[PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0"?

Ah - yes! I'll revive that since Linus is handling the IVC / ISP ones

Thanks
Dan

> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

