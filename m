Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3ED3AE70F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910520; cv=none; b=svlWe89DVyew5XM2gsnTWF0D4z2Tz/e3RQaUmaHQ2md6UuD0lzNeEzv1HM3V+rsE3V0znuq7dEGPsKPD70VFnLUCXyK9X/owkQlhqK4gpJzxWj1CXC6ABZxewrRhHhr5sIGqKS1YpsAaBXTjBfRw6INVP09MrmXjrybJ0EvGz3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910520; c=relaxed/simple;
	bh=4zs2htRN5fDjYf/gfjJ1ytgBtvvSkEHoglb5+vpYN3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRAV5NW0/srrjIsSdMj21AU/J92guP7KRTEGBE0qSzVR6IjoTzfoRzz3bbQjW6nJgrQGiBgxL5Wl2EiU4pvjG2U5qfPHx9eszBYPGkR1ulWerXuNAPSVRPcOf7dz5gnK1PMOjTGoHO1BvY0Bj0yJjSkexZXaeCUnFVNzPCuthTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qOpcvy4P; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qOpcvy4P"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439bcec8613so470491f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 01:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910517; x=1774515317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7GEIa3OAsHJyOXA/AHM/E033RW8A4eSsP/qQLiJdUw=;
        b=qOpcvy4PyuYumXY/Q6TMUEv2CuiWVW0e6eMLvYa8EwYth4he3BrbK6fiC77FUL22od
         w8Gw45KCqlp0FBdbfWHCQJwd6P+HcessnTi7MdePCFvJGfg4szTe3jmZifM6eHAMSuvT
         nMed8FAK9IuuMuNrOS2z2PnIYYXpS1CFVawr/ExcvbWrfOlA8k6UuKoH02INB6gQwBNV
         mStyEZs16Yz8PQJNshIOqNcRoTQOl42E8DdNIYhxM79xOwUwmDvLDo6zK/gq6BUsX32u
         3npKxULLsbac9baWJugjwM8fjUUEbFJk5zmZWx1hBWB8WP3yegIxYcO+yCPQkDo502Xe
         Z3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910517; x=1774515317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N7GEIa3OAsHJyOXA/AHM/E033RW8A4eSsP/qQLiJdUw=;
        b=nCj8BiWGRP5uwt4G4pOlWhIZ7migAIEyj7pp7UVq4DxorNTNbAKL+lE9BzmQYFKSnB
         fIbSp04r0gcliniWYW7BA3i8u1lYJiv2dNItHakszKi629vK5fsmQ5be/ljcf3Cg/Twx
         ADCRuFBGKCH0vnm1JrVALup78QryZelhq52RPNfcVgFhg7naeBgy+mj+h5P1/h/Jue8H
         L+YW9XLkPeGNh9sX2Zi57VvE7v+fuPB4VDyNrsm/FsJ390dGLkoawdmxfkAVLdn986mA
         pLUWStAULhpcZ6/gnMjG3AUHgM1fXU/egML31bPp7NG59R5OV1RMf++dK4sxY4JB7g/v
         NIcg==
X-Forwarded-Encrypted: i=1; AJvYcCUHfGEBEG5rFk6N/tgrPNV32XZVI752lJNgDjvSlrjBABfWu9urfyBDlE/2f1L+2yuly3xWE3FCe1epvMIl2WtV6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx07qT11UhQhfbcDBQqSg87Kc8Y629xBPLlFVprBv3IP8kY41Dh
	a7jq5HdIpBGtRfjcYznkm+IxH88YbSfzjXkhcQyY8WzAr7Uqvl5pBiCSouCV1YUDUtI=
X-Gm-Gg: ATEYQzw7XK8f1/KPzfzboRUNX5MKzOXKTNNNp02CjoEokUYMLMGnXW1qJarYxSrlK2m
	QS9rmXoT/TaEHKD7leFXoJVQktL7kd4gacGx4RVCwtUhhleom7Ha2SQQPmYJ1jwPTXcl4rt4lzs
	AenhVMl/f1gLjo4oK9HBIEQheIGbjABRI1RS2IbwdcMHUYw6Q+VG83vDC7+jHk/yD4Z5WSnxmED
	zJsZm7pEMuDkd4ZROziXS5E98aXddk8w04hp6uB25B17hMTfqU2rvXC7r1R1KkQkpgjCG5knGo8
	5CRUaZKDcqrpd/hKJw9bGDKvEdLXp2egu3DHIr7862ogyUamUZLc2AtP76Bm54gn15keFnwh4nf
	J5n9fy3uiF4U5nCGx5vCiazPHnsWBihRKeoJq1Ds5fIVbn/aXSsEgYTs99CS/QHCdpFJnCm6zvH
	R4hq80anAFcNWCQc92kcgSJVDQnZP1IyiXzR+NN78UHvJ9
X-Received: by 2002:a05:6000:186d:b0:43b:3f2d:7d43 with SMTP id ffacd0b85a97d-43b527a41d1mr10142006f8f.8.1773910516752;
        Thu, 19 Mar 2026 01:55:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518588a0sm23072267f8f.16.2026.03.19.01.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 19 Mar 2026 09:55:10 +0100
Subject: [PATCH v6 4/5] arm64: dts: qcom: sm8650: Add sound DAI prefix for
 DP
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-4-797bf96df771@linaro.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4zs2htRN5fDjYf/gfjJ1ytgBtvvSkEHoglb5+vpYN3M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpu7nunPYOhTiI99B5Q/bNgHEtHbrjhLdq7ubLUAcH
 lJSCB2qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCabu57gAKCRB33NvayMhJ0cAmEA
 CM/lnQzXzLyU8ArEX7ukS0vkNKBQz38y9Nv6eGSyPOQY0sDW3YmKM9yzSVKIjuL024yDvar2AUX8Ih
 st4dPbKYq+/lFKSSZTLwlNoGFaCptRBZNG94QHR3jSMV6OJd8Dyyb/9Wo0R2euulXJChBmy3OeMNAn
 2Aqw3aFaUku1Sj+H42NVncVW4kCCdcZradlXFKwOzOjBvgSkTDiRPX9Fh0eS4mqeMqkMORmdpM/6ui
 Bs2rwZJeaSK57gYJTod5eitu3i+Rejj1ZI0VzhOFLjYFaU6e0ACxBsETiyoXQwOEe5fJlDkrzgD69u
 fztO+Yt/jR+5c29qszteEBbQX9OrWhv/Kx5smzn2EvTFq8OfE2tmVyXrX1KbSdfCzjSjbO3rjLFueN
 M2NlPQFHujH7X3gdQ9SWa7N0VXFYc42eIyS4ofCl4ZBA48aDyueC+lKX01m/u1dT3+WgaEJigz0T3k
 bcVhyt5NKoUFBuY2IhHd3j5o/2cUiCEBoVLp9p6FxgO1QNMlJQlDLS4l8wV2KUp2ees3gEJY5tzk34
 BLluwcybNLRwOrwrlXkJ7PQogiAG5BAPSusADSPqdfyK0QoQ5XUmZ4R+xN1KWHqMaAgo0rJn6GwHGP
 pf+WlySA0ojDgxmJDj05DSh919K16ItqTM9vtaeCck2t9pdgp9L0V024wsFw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
controller, need to add dedicated prefix for these mixers to avoid
conflicts and to allow ALSA to properly configure given instance.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 357e43b90740..f172c78367c7 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5905,6 +5905,7 @@ mdss_dp0: displayport-controller@af54000 {
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
+				sound-name-prefix = "DisplayPort0";
 
 				status = "disabled";
 

-- 
2.34.1

