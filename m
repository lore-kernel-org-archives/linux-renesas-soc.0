Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EBC3F65EB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653641; cv=none; b=iSyOgoWcVt1LdSK13gj+WbFhFdQqA4Jxkjvlm785aunROkJAgQ1ugvPLCNRvkJKIzAig+sLucY2+eRsZyFZ3Ci3fVeQr3crt/87vRKIThoqwYFZjtKTzWSMoH5FqcFFbtf5Gfff2K4kKCN+Nk0xd+KF9VwRINEuzncZ+MAioHpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653641; c=relaxed/simple;
	bh=VQh5nem3gKEdyS4EEAM8gufXvOd9+2NjEM3orr1IqEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/uAJ5iUD5zYuVYMwca3h/IgC7DMHuf6pKU1xJjrLC/UIqFAW0ZS/bDCvdUEmDMQJckB/uSBMmLwQzvqCAKvZHJ5mdHZbeW1E+6nA8Dql9bK44eQk/CMiI2kineYPJBwHqctueG5S9fQhgw6vafPIjh4RdcDjnzN1WKYsuuqutU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-73720e58dafso2468481137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 03:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653639; x=1788258439;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NMhzQMeM3nliAFUhzIIevbSwUI95NmvlEJTJ9DerXJQ=;
        b=a8J+hUESepkO5Gg7ralnCdytb3v+oRHJbVAvX/nqkN6Hlql1qUHaOwk29InW6z8In2
         SFPQeM4+1GDPtwSnqPnP5hNEhwtPrltQbOsI9pLggkOE0volAFwtTm90Amg+F2EW+tjy
         2a77aLNltlvjp9wfPF0sIH1Lq/rMGp17OzzoatfDMje5H3j3QkGyjaNr6oVcdUTWD/Au
         e/4ULz2BzRM6otB5bXJXRFv4ffIYafdp/aiDH8uE7GzV1uMTd+xOYEC6cJDcSLck1ZhW
         Ehd9WwphB++w0mLp18Ww5qD0eh2a3OE41nkwaYYY+imtlsXm8A1b/GD7nJjqQMUxP5R8
         bHiA==
X-Forwarded-Encrypted: i=1; AHgh+RrESaNPgMJzxDl4BgUdnChLTnlaTE1GqnY1nSnIEKeoT5t/Cp69CwEtUImEx19o9T9SRWKMqoPzjW5KErRAf2BOLQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lNByVnQmuxZg3VCDERlZCk6A/9W3tQR1nbEyuYvltoOOUDDepy
	eEnNA5ZhQDLSfum/YZfTrd7h96NgQ6JGaKJFtTWs6NNZTogB8gOu1qTKFBUt4TWhEyM=
X-Gm-Gg: AR+sD135WoN7Ln+278d164lbdnkR7pQyOOPz4WAVD7jvudd91qVH2l+HCAOO1nKi/u6
	bQwKEr7z1n+1GgvfbC7xqdybQUNRddl/JJhvwcE60Gp3IDChmTSOLTKmq+0qtCVlIJvDfLDiASj
	iFq4+xrpKOBN2pTUrOYx0xOoi+Z4/9yikTNDxP8dgJWupskzFGWvWE5yhXfKdmGz+C8G/qdukHx
	+2jIhNbXC9uERvwkP7d/NF93Xr3xM58995Qf8CLQDMA3cC4wfpSg7quHOkY5YthYxDHC98OwyN6
	baf2/Zian8NAS8wwE9YAR6EGcI6PU5uzmX4RJI58NBBM0R7EROqLbrZNPq9Q+clssbjXVRqsIN6
	mqSnNX3yaJdlkSa5ThgIQz+OUvQoEyHoOwe+GVgAq7wmwWaIfq/fXcD41ZqBvC+u99IW9jsJjuy
	ldc8I7oMytIaIwgjkCft1qV20HPBVCtwbMDraAsmgZRvW4+hkCtWqjI6U1CbAKsTG/Z5GQ+vuCj
	VfowgIwzGk06x677QTLs/TtBw==
X-Received: by 2002:a05:6102:508c:b0:779:1f8f:b6e7 with SMTP id ada2fe7eead31-77fe61557a3mr2345286137.3.1787653639208;
        Tue, 25 Aug 2026 03:27:19 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c8374f3a4sm10025555241.11.2026.08.25.03.27.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:27:18 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97c441e66f0so2216404241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 03:27:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrIvN7R2ttx5MdlZKWRXeVhPM407IvGMHuTweo1lrq5yypLuN7WsTiPjbxM3CyCXmBF6VOnM8QclKivcRdgCf3atQ==@vger.kernel.org
X-Received: by 2002:a67:e704:0:b0:781:1ac:8232 with SMTP id
 ada2fe7eead31-78101acbf3amr434101137.5.1787653638529; Tue, 25 Aug 2026
 03:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822075813.199336-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260822075813.199336-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 12:27:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3yfDq8reGL_yvwgOpz04yvSrHLzMsQ8jCP+b4xC34uQ@mail.gmail.com>
X-Gm-Features: AcwNN1Wj9vyn8DJ9WAPu7bezDHW09jHEm6VaLzU60Dxiy5n7b-T29KqpuXUcTTg
Message-ID: <CAMuHMdX3yfDq8reGL_yvwgOpz04yvSrHLzMsQ8jCP+b4xC34uQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Use hyphens in node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Sat, 22 Aug 2026 at 09:58, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> DTS coding style encourages to use hyphens instead of underscores in
> node names. DTC W=2 warns about underscores. Improve existing code
> because apparently people copy it instead of following DTS coding style
> for new submissions.
>
> Semi-manual validation by checking if no new nodes appeared:
>
>   $ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; fdtdump ${i} > ${i}.fdt ; fdtdump dts-new/${i#dts-old/} > dts-new/${i#dts-old/}.fdt ; diff -ubB ${i}.fdt dts-new/${i#dts-old/}.fdt ; done | grep -v ' {'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
> +++ b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi

> @@ -696,7 +696,7 @@ i2c3_pins: i2c3 {
>                 function = "i2c3";
>         };
>
> -       irq0_pins: irq0_pins {
> +       irq0_pins: irq0-pins {

This one shouldn't have used a "_pins" suffix in the first place.
I will sneak in that change while applying ;-)

>                 groups = "intc_ex_irq0_a";
>                 function = "intc_ex";
>         };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
