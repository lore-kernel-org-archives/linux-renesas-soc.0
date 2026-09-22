Received: from mta0.migadu.com (out-6.mta0.migadu.com [91.218.175.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFA046D0A8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 21:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111533; cv=none; b=hCSaeUMjwDezTuJDxXgz7QV8qaYA6ssFM9Gte1NU1YtOtovjbl4PW08OST2FKcLnQYpTma9/IMdUgLXWeQoaFA1x7bAPJkGOMUOsWx/Cg8SalccSLEg1lFHpp5lMq+tjD+zZdSSt2MZSy9PASxfu+mxwpZv7gq3FEieOI5+wQBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111533; c=relaxed/simple;
	bh=h6gV+3keWNApMlq6c6RQ82PoZscfFWn/9tcB/SrgqS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMJ85XMwCdU1KHsiSBYXw1rCz8ZF2fFOEL0PU2poOpr72PN99b7C52YTqs5l1p8UU38ep84RmoROfcEs9llxyNun7l54qHZ2UFHnJ5Hhbp9Cz2SIq2CyWQr/AT+9j7RIpFC+eCb0vuvgT7bMnWMdSt9itE7yil+jYlmSmU0NMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XzLrsmxA; arc=none smtp.client-ip=91.218.175.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XzLrsmxA"
X-Envelope-To: linux-renesas-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h6gV+3keWNApMlq6c6RQ82PoZscfFWn/9tcB/SrgqS4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790111509; v=1; x=1790716309;
 b=XzLrsmxAJe3c5VCrKFBm5TkgcE/NBnvaZEe17VOida5iu99lzN3+vAzlaKNoMJAA9d0shaB5
 /WI5LRFqvguRrOpkxDcv5+/zDNVIEv5EldcH3v7AvUwNYcPyA2Qe+Jcci3/9cTMjfiVjCMJOJnG
 kkD0xfgNqb9OpfVDsE6THes0=
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b2bc90bf256640a0;
	Tue, 22 Sep 2026 21:11:49 +0000
X-Mizu-Trace-ID: b2bc90bf256640a0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso1104e87.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 14:11:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLprCLwDKWMNhMJolVFgbk+yJnG/FeCtSu/ypaYPAGGSkN9CJzxh01o+4kmRy48Q7jifhNj9XgSYI1Kb8HSC8zaQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kFV+Flr8BYIyIbxM45Ro+I/JHrT7UdqorAs4XJ2pmpXvPYXOMA
	CFhL3xxx+FJVt8W2Oruzlx6V4e9/0tWGXtHEOlDLON67LcyuHNXEbuENzrD3scisLBQRBKdfYzE
	7thsgJVTwL4BtJG8vNszsRHM3lfo4/QOnEpuuxv5Q
X-Received: by 2002:a05:6512:234c:b0:5b8:c871:4754 with SMTP id
 2adb3069b0e04-5b8d87f8ce6mr53229e87.2.1790111508201; Tue, 22 Sep 2026
 14:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918091052.2825315-1-fuad.tabba@linux.dev>
 <95685b0e-21dd-4446-8fef-c5664cea4057@mailbox.org> <20260922063830.472642-1-fuad.tabba@linux.dev>
 <61488ddc-b346-4ba3-b32a-e972a3bd75a4@mailbox.org>
In-Reply-To: <61488ddc-b346-4ba3-b32a-e972a3bd75a4@mailbox.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 22 Sep 2026 22:11:12 +0100
X-Gmail-Original-Message-ID: <CA+EHjTySaPWEDxY1QCjeAigetT1yzsspdY+v7srEzkS=kQdegg@mail.gmail.com>
X-Gm-Features: AcwNN1X2giFzDcFTBdxOtsqsnFJaBT3pUFrmornAsIBh_cAT0iiBtOfA2kEGgxk
Message-ID: <CA+EHjTySaPWEDxY1QCjeAigetT1yzsspdY+v7srEzkS=kQdegg@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-gen4: Fix device_node leak in rcar_gen4_pcie_host_msi_addr()
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 22 Sept 2026 at 19:07, Marek Vasut <marek.vasut@mailbox.org> wrote:
[...]
> Oh, this is very nice, TIL, thank you.
>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org> # Retronix
> R-Car V4H Sparrow Hawk

Thanks.

>
> >> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >
> > [...]
> >
> >> "
> >>
> >> Also, I think drivers/pci/controller/pcie-iproc.c
> >> iproc_pcie_msi_enable() needs similar fix ?
> >
> > I don't think so: iproc_pcie_msi_enable() already puts the node at out_put_node, on the steer failure and the success paths alike.
>
> Could you maybe send similar simplification patch ?

Sure: https://lore.kernel.org/all/20260922210839.3765444-1-fuad.tabba@linux.dev/

Cheers,
/fuad

>
> Thank you !
>
> --
> Best regards,
> Marek Vasut
